package maintemplatev2

import (
	"github.com/spf13/cobra"

	corebus "github.com/getcouragenow/sys-share/sys-core/service/go/pkg/bus"
	"github.com/getcouragenow/sys-share/sys-core/service/logging"
	"github.com/getcouragenow/sys-share/sys-core/service/logging/zaplog"

	bsSvc "github.com/getcouragenow/main/deploy/bootstrapper/service/go"
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2/wrapper"
)

var (
	bsCliCfgPath      string
	mainClientCfgPath string
	isCliDebug        bool
)

const (
	commandName                 = "cli"
	errCreateCli                = "error creating cli for " + commandName + ": %v"
	defaultBsCliConfigPath      = "./config/bootstrap-client.yml"
	defaultMainConfigClientPath = "./config/main-client.yml"
	defaultCliDebug             = true
)

func MainCliCommand(version []byte) (*cobra.Command, logging.Logger) {
	var rootCmd = &cobra.Command{
		Use:   commandName,
		Short: commandName,
	}

	rootCmd.PersistentFlags().BoolVar(&isCliDebug, "debug", defaultCliDebug, "debug")
	rootCmd.PersistentFlags().StringVarP(&bsCliCfgPath, "bootstrap-config-path", "b", defaultBsCliConfigPath, "bs config path to use")
	rootCmd.PersistentFlags().StringVarP(&mainClientCfgPath, "main-config-path", "m", defaultMainConfigClientPath, "main config path to use")
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
	mainCfg, err := wrapper.NewConfig(mainClientCfgPath)
	if err != nil {
		logger.Fatalf(errSourcingConfig, "main-wrapper", err)
	}
	bscfg, err := bsSvc.NewConfig(bsCliCfgPath)
	if err != nil {
		logger.Fatalf(errSourcingConfig, "bootstrapper", err)
	}
	mainCli, err := wrapper.NewMainCLI(
		logger,
		mainCfg,
		bscfg,
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
