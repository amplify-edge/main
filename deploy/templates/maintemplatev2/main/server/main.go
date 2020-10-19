package main

import (
	grpcMw "github.com/grpc-ecosystem/go-grpc-middleware"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"google.golang.org/grpc"

	"github.com/getcouragenow/sys/main/pkg"
)

const (
	errSourcingConfig   = "error while sourcing config for %s: %v"
	errCreateSysService = "error while creating sys-* service: %v"

	defaultPort                 = 8888
	defaultSysCoreConfigPath    = "./config/syscore.yml"
	defaultSysAccountConfigPath = "./config/sysaccount.yml"
)

var (
	rootCmd        = &cobra.Command{Use: "maintemplatev2"}
	coreCfgPath    string
	accountCfgPath string
	mainexPort     int
)

func main() {
	// persistent flags
	rootCmd.PersistentFlags().StringVarP(&coreCfgPath, "sys-core-config-path", "c", defaultSysCoreConfigPath, "sys-core config path to use")
	rootCmd.PersistentFlags().StringVarP(&accountCfgPath, "sys-account-config-path", "a", defaultSysAccountConfigPath, "sys-account config path to use")
	rootCmd.PersistentFlags().IntVarP(&mainexPort, "port", "p", defaultPort, "grpc port to run")

	// logging
	logger := logrus.New().WithField("bin", "maintemplatev2")

	rootCmd.RunE = func(cmd *cobra.Command, args []string) error {
		// configs
		sspaths := pkg.NewServiceConfigPaths(coreCfgPath, accountCfgPath)
		sscfg, err := pkg.NewSysServiceConfig(logger, nil, sspaths, defaultPort)
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
		// rutn server
		return sysSvc.Run(grpcWebServer, nil)
	}
	if err := rootCmd.Execute(); err != nil {
		logger.Fatalf("error running sys-main: %v", err)
	}
}
