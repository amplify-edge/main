// This is not really clean but anyway, just to keep it going
package main

import (
	"context"
	"flag"
	"fmt"
	grpcMw "github.com/grpc-ecosystem/go-grpc-middleware"
	grpcLogrus "github.com/grpc-ecosystem/go-grpc-middleware/logging/logrus"
	grpcRecovery "github.com/grpc-ecosystem/go-grpc-middleware/recovery"

	"time"

	"github.com/sirupsen/logrus"
	"google.golang.org/grpc"

	modpkg "github.com/getcouragenow/mod/main/pkg"
)

// TODO @gutterbacon: Every kind of configs are hardcoded for now.
const (
	// TODO @gutterbacon: JSONNET config
	defaultPort    = 9074
	defaultSysPort = 9075
	defaultTimeout = 5 * time.Second
	defaultSysHost = "127.0.0.1"

	errConnectingMainSys = "error while trying to connect to mainsys: %v"
	errCreateSysService  = "error while creating modmainv3 service: %v"
)

var (
	port    = flag.Int("port", defaultPort, "the port to serve on")
	sysPort = flag.Int("sysport", defaultSysPort, "the mainsys port to connect to")
	sysHost = flag.String("syshost", defaultSysHost, "the IP address mainsys is running at")
)

func recoveryHandler(l *logrus.Entry) func(panic interface{}) error {
	return func(panic interface{}) error {
		l.Warnf("sys-account service recovered, reason: %v",
			panic)
		return nil
	}
}

func main() {
	flag.Parse()
	l := logrus.New().WithField("svc", "mainmodv3")
	ctx, cancel := context.WithTimeout(context.Background(), defaultTimeout)
	defer cancel()

	dialConn, err := grpc.DialContext(ctx, fmt.Sprintf("%s:%d", *sysHost, *sysPort), grpc.WithInsecure())
	if err != nil {
		l.Fatalf(errConnectingMainSys, err)
	}

	modsvc, err := modpkg.NewModService(l, *port, nil, nil, dialConn, nil)
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
}
