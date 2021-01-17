// This is not really clean but anyway, just to keep it going
package main

import (
	"time"

	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"

	// gcn packages
	// modpkg "github.com/getcouragenow/mod/main/pkg"
)

const (
	// TODO @gutterbacon: JSONNET config for mod-*
	defaultPort      = 9074
	defaultSysPort   = 9075
	defaultTimeout   = 5 * time.Second
	defaultSysHost   = "127.0.0.1"
	defaultLocal     = true
	defaultStaticDir = "./client/build/web"

	errConnectingMainSys = "error while trying to connect to mainsys: %v"
	errCreateSysService  = "error while creating mainmodv3 service: %v"
	errRunningMainMod    = "error running mainmodv3: %v"
)

var (
	rootCmd   = &cobra.Command{Use: "mainmod"}
	port      int
	sysPort   int
	sysHost   string
	local     bool
	staticDir string
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
	rootCmd.PersistentFlags().StringVarP(&sysHost, "mainsys-host", "m", defaultSysHost, "Host IP of running mainsys process")
	rootCmd.PersistentFlags().BoolVarP(&local, "local", "l", defaultLocal, "serve locally")
	rootCmd.PersistentFlags().StringVarP(&staticDir, "directory", "d", defaultStaticDir, "directory to serve flutter build")

	l := logrus.New().WithField("svc", "mainmodv3")

	rootCmd.RunE = func(cmd *cobra.Command, args []string) error {
		// ctx, cancel := context.WithTimeout(context.Background(), defaultTimeout)
		// defer cancel()
		//
		// dialConn, err := grpc.DialContext(ctx, fmt.Sprintf("%s:%d", sysHost, sysPort), grpc.WithInsecure())
		// if err != nil {
		// 	l.Fatalf(errConnectingMainSys, err)
		// }

		// modsvc, err := modpkg.NewModService(l, port, nil, nil, dialConn, nil)
		// if err != nil {
		// 	l.Fatalf(errCreateSysService, err)
		// }

		// unaryItc, streamItc := modsvc.InjectInterceptors(nil, nil)
		// recoveryOptions := []grpcRecovery.Option{
		// 	grpcRecovery.WithRecoveryHandler(recoveryHandler(l)),
		// }
		// logrusOpts := []grpcLogrus.Option{
		// 	grpcLogrus.WithLevels(grpcLogrus.DefaultCodeToLevel),
		// }
		// unaryItc = append(unaryItc, grpcRecovery.UnaryServerInterceptor(recoveryOptions...), grpcLogrus.UnaryServerInterceptor(l, logrusOpts...))
		// streamItc = append(streamItc, grpcRecovery.StreamServerInterceptor(recoveryOptions...), grpcLogrus.StreamServerInterceptor(l, logrusOpts...))

		// grpc
		// grpcServer := grpc.NewServer(
		// 	grpcMw.WithUnaryServerChain(unaryItc...),
		// 	grpcMw.WithStreamServerChain(streamItc...),
		// )
		// register service
		// modsvc.RegisterServices(grpcServer)
		// grpcWebServer := modsvc.RegisterGrpcWebServer(grpcServer)
		// if local {
		// 	fileServer := http.FileServer(http.Dir(staticDir))
		// 	httpServer := &http.Server{
		// 		Handler: h2c.NewHandler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		// 			w.Header().Set("Access-Control-Allow-Origin", "*")
		// 			w.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
		// 			w.Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, X-User-Agent, X-Grpc-Web")
		// 			l.Infof("Request Endpoint: %s", r.URL)
		// 			if strings.Contains(r.URL.Path, "v2") {
		// 				// grpcWebServer.ServeHTTP(w, r)
		// 			} else {
		// 				fileServer.ServeHTTP(w, r)
		// 			}
		// 		}), &http2.Server{}),
		// 	}
		// 	// modsvc.Run(grpcWebServer, httpServer)
		// } else {
		// 	// modsvc.Run(grpcWebServer, nil)
		// }
		return nil
	}
	if err := rootCmd.Execute(); err != nil {
		l.Fatalf(errRunningMainMod, err)
	}

}
