package wrapper

import (
	bsSvc "github.com/getcouragenow/main/deploy/bootstrapper/service/go"
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2/wrapper/helpers"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
)

var (
	bsCliCfgPath string
	isCliDebug   bool
)

const (
	commandName            = "v2-sdk"
	errCreateCli           = "error creating cli for " + commandName + ": %v"
	defaultBsCliConfigPath = "./config/bootstrap-client.yml"
	defaultCliDebug        = true
)

func MainCliCommand() *cobra.Command {
	var rootCmd = &cobra.Command{
		Use:   commandName,
		Short: commandName,
	}

	rootCmd.PersistentFlags().BoolVar(&isCliDebug, "debug", defaultCliDebug, "debug")
	rootCmd.PersistentFlags().StringVarP(&bsCliCfgPath, "bootstrap-config-path", "b", defaultBsCliConfigPath, "bs config path to use")
	rootCmd.PersistentFlags().StringVarP(&mainCfgPath, "main-config-path", "m", defaultMainCfgPath, "main config path to use")

	// logging
	log := logrus.New()
	if isDebug {
		log.SetLevel(logrus.DebugLevel)
	} else {
		log.SetLevel(logrus.InfoLevel)
	}
	logger := log.WithField("maintemplate", "v2")
	// configs
	logger.Infof("Running maintemplatev2-sdk-cli")
	mainCfg, err := helpers.NewConfig(mainCfgPath)
	if err != nil {
		logger.Fatalf(errSourcingConfig, "main-wrapper", err)
	}
	bscfg, err := bsSvc.NewConfig(bsCfgPath)
	if err != nil {
		logger.Fatalf(errSourcingConfig, "bootstrapper", err)
	}
	mainCli, err := helpers.NewMainCLI(
		logger,
		mainCfg,
		bscfg,
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
	)
	return rootCmd
}
