package maintemplatev2

import (
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"

	bsSvc "github.com/getcouragenow/main/deploy/bootstrapper/service/go"
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2/version"
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2/wrapper"
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

	b, err := version.Asset("manifest.json")
	if err != nil {
		logger.Fatalf("unable to open build version information: %v", err)
	}
	buildInfo, err := wrapper.ManifestFromFile(b)
	if err != nil {
		logger.Fatalf("unable to unmarshal build version information: %v", err)
	}

	// configs
	logger.Infof("Running maintemplatev2-sdk-cli")
	mainCfg, err := wrapper.NewConfig(mainCfgPath)
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
	return rootCmd
}
