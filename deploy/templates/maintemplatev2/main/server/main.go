package main

import (
	grpcMw "github.com/grpc-ecosystem/go-grpc-middleware"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
	"google.golang.org/grpc"
	"net/http"
	"strings"

	"github.com/getcouragenow/sys/main/pkg"
)

const (
	errSourcingConfig   = "error while sourcing config for %s: %v"
	errCreateSysService = "error while creating sys-* service: %v"

	defaultPort                 = 9074
	defaultSysCoreConfigPath    = "./config/syscore.yml"
	defaultSysAccountConfigPath = "./config/sysaccount.yml"
	defaultLocal                = true
	defaultStaticDir            = "./client/build/web"
)

var (
	rootCmd        = &cobra.Command{Use: "maintemplatev2"}
	coreCfgPath    string
	accountCfgPath string
	mainexPort     int
	local          bool
	staticDir      string
)

func main() {
	// persistent flags
	rootCmd.PersistentFlags().StringVarP(&coreCfgPath, "sys-core-config-path", "c", defaultSysCoreConfigPath, "sys-core config path to use")
	rootCmd.PersistentFlags().StringVarP(&accountCfgPath, "sys-account-config-path", "a", defaultSysAccountConfigPath, "sys-account config path to use")
	rootCmd.PersistentFlags().IntVarP(&mainexPort, "port", "p", defaultPort, "grpc port to run")
	rootCmd.PersistentFlags().BoolVarP(&local, "local", "l", defaultLocal, "serve locally")
	rootCmd.PersistentFlags().StringVarP(&staticDir, "directory", "d", defaultStaticDir, "directory to serve flutter build")

	// logging
	logger := logrus.New().WithField("maintemplate", "v2")

	rootCmd.RunE = func(cmd *cobra.Command, args []string) error {
		// configs
		sspaths := pkg.NewServiceConfigPaths(coreCfgPath, accountCfgPath)
		sscfg, err := pkg.NewSysServiceConfig(logger, nil, sspaths, mainexPort)
		if err != nil {
			logger.Fatalf(errSourcingConfig, err)
		}

		// initiate all sys-* service
		sysSvc, err := pkg.NewService(sscfg)
		if err != nil {
			logger.Fatalf(errCreateSysService, err)
		}

		// initiate grpc server
		unaryInterceptors, streamInterceptors := sysSvc.InjectInterceptors(nil, nil)
		grpcServer := grpc.NewServer(
			grpcMw.WithUnaryServerChain(unaryInterceptors...),
			grpcMw.WithStreamServerChain(streamInterceptors...),
		)
		sysSvc.RegisterServices(grpcServer)
		grpcWebServer := sysSvc.RegisterGrpcWebServer(grpcServer)
		if local {
			fileServer := http.FileServer(http.Dir(staticDir))
			httpServer := &http.Server{
				Handler: h2c.NewHandler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
					w.Header().Set("Access-Control-Allow-Origin", "*")
					w.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
					w.Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, X-User-Agent, X-Grpc-Web")
					logger.Infof("Request Endpoint: %s", r.URL)
					if strings.Contains(r.URL.Path, "v2") {
						grpcWebServer.ServeHTTP(w, r)
					} else {
						fileServer.ServeHTTP(w, r)
					}
				}), &http2.Server{}),
			}
			return sysSvc.Run(grpcWebServer, httpServer)
		}
		return sysSvc.Run(grpcWebServer, nil)
	}
	if err := rootCmd.Execute(); err != nil {
		logger.Fatalf("error running sys-main: %v", err)
	}
}
