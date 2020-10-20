// This is not really clean but anyway, just to keep it going
package main

import (
	// stdlib
	"context"
	"fmt"
	"time"

	// external
	grpcMw "github.com/grpc-ecosystem/go-grpc-middleware"
	grpcLogrus "github.com/grpc-ecosystem/go-grpc-middleware/logging/logrus"
	grpcRecovery "github.com/grpc-ecosystem/go-grpc-middleware/recovery"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"google.golang.org/grpc"

	// gcn packages
	modpkg "github.com/getcouragenow/mod/main/pkg"
)

const (
	// TODO @gutterbacon: JSONNET config for mod-*
	defaultPort    = 9074
	defaultSysPort = 9075
	defaultTimeout = 5 * time.Second
	defaultSysHost = "127.0.0.1"

	errConnectingMainSys = "error while trying to connect to mainsys: %v"
	errCreateSysService  = "error while creating mainmodv3 service: %v"
	errRunningMainMod    = "error running mainmodv3: %v"
)

var (
	rootCmd = &cobra.Command{Use: "mainmod"}
	port    int
	sysPort int
	sysHost string
)

func recoveryHandler(l *logrus.Entry) func(panic interface{}) error {
	return func(panic interface{}) error {
		l.Warnf("sys-account service recovered, reason: %v",
			panic)
		return nil
	}
}

func main() {
	rootCmd.PersistentFlags().IntVarP(&port, "port", "p", defaultPort, "the port to serve on")
	rootCmd.PersistentFlags().IntVarP(&sysPort, "mainsys-port", "s", defaultSysPort, "TCP port of running mainsys process")
	rootCmd.PersistentFlags().StringVarP(&sysHost, "mainsys-host", "h", defaultSysHost, "Host IP of running mainsys process")

	l := logrus.New().WithField("svc", "mainmodv3")

	rootCmd.RunE = func(cmd *cobra.Command, args []string) error {
		ctx, cancel := context.WithTimeout(context.Background(), defaultTimeout)
		defer cancel()

		dialConn, err := grpc.DialContext(ctx, fmt.Sprintf("%s:%d", sysHost, sysPort), grpc.WithInsecure())
		if err != nil {
			l.Fatalf(errConnectingMainSys, err)
		}

		modsvc, err := modpkg.NewModService(l, port, nil, nil, dialConn, nil)
		if err != nil {
			l.Fatalf(errCreateSysService, err)
		}

		unaryItc, streamItc := modsvc.InjectInterceptors(nil, nil)
		recoveryOptions := []grpcRecovery.Option{
			grpcRecovery.WithRecoveryHandler(recoveryHandler(l)),
		}
		logrusOpts := []grpcLogrus.Option{
			grpcLogrus.WithLevels(grpcLogrus.DefaultCodeToLevel),
		}
		unaryItc = append(unaryItc, grpcRecovery.UnaryServerInterceptor(recoveryOptions...), grpcLogrus.UnaryServerInterceptor(l, logrusOpts...))
		streamItc = append(streamItc, grpcRecovery.StreamServerInterceptor(recoveryOptions...), grpcLogrus.StreamServerInterceptor(l, logrusOpts...))

		// grpc
		grpcServer := grpc.NewServer(
			grpcMw.WithUnaryServerChain(unaryItc...),
			grpcMw.WithStreamServerChain(streamItc...),
		)
		// register service
		modsvc.RegisterServices(grpcServer)
		grpcWebServer := modsvc.RegisterGrpcWebServer(grpcServer)
		modsvc.Run(grpcWebServer, nil)
		return nil
	}
	if err := rootCmd.Execute(); err != nil {
		l.Fatalf(errRunningMainMod, err)
	}

}
