package maintemplatev2

import (
	"github.com/spf13/cobra"

	corebus "github.com/amplify-cms/sys-share/sys-core/service/go/pkg/bus"
	"github.com/amplify-cms/sys-share/sys-core/service/logging"
	"github.com/amplify-cms/sys-share/sys-core/service/logging/zaplog"

	"github.com/amplify-cms/main/deploy/templates/maintemplatev2/wrapper"
)

var (
	clientCfgPath string
	isCliDebug        bool
)

const (
	commandName                       = "cli"
	errCreateCli                      = "error creating cli for " + commandName + ": %v"
	defaultMainConfigServerClientPath = "./config/config-client.yml"
	defaultCliDebug                   = true
)

func MainCliCommand(version []byte) (*cobra.Command, logging.Logger) {
	var rootCmd = &cobra.Command{
		Use:   commandName,
		Short: commandName,
	}

	rootCmd.PersistentFlags().BoolVar(&isCliDebug, "debug", defaultCliDebug, "debug")
	rootCmd.PersistentFlags().StringVarP(&clientCfgPath, "client-config-path", "c", defaultMainConfigServerClientPath, "client config path to use")
	// logging
	var logger *zaplog.ZapLogger
	if isDebug {
		logger = zaplog.NewZapLogger(zaplog.DEBUG, defaultAppName, true, "")
	} else {
		logger = zaplog.NewZapLogger(zaplog.INFO, defaultAppName, false, "gcn-client.log")
	}
	logger.InitLogger(nil)

	buildInfo, err := wrapper.ManifestFromFile(version)
	if err != nil {
		logger.Fatalf("unable to unmarshal build version information: %v", err)
	}

	// configs
	mainCfg, err := wrapper.NewClientConfig(clientCfgPath)
	if err != nil {
		logger.Fatalf(errSourcingConfig, "main-wrapper", err)
	}
	bscfg := mainCfg.BootstrapConfig

	mainCli, err := wrapper.NewMainCLI(
		logger,
		&mainCfg.MainConfigClient,
		&bscfg,
		corebus.NewCoreBus(),
	)
	if err != nil {
		logger.Fatalf(errCreateCli, err)
	}
	// load up sys & mod
	rootCmd.AddCommand(
		mainCli.SysAccount.CobraCommand(),
		mainCli.SysCore.CobraCommand(),
		mainCli.SysMail.CobraCommand(),
		mainCli.SysBus.CobraCommand(),
		mainCli.BootstrapCLI,
		mainCli.ModDisco,
		buildInfo.CobraCommand(),
	)
	return rootCmd, logger
}
