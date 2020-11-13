package main

import (
	bsSvc "github.com/getcouragenow/main/bootstrapper/service/go"
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2/wrapper"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
)

var (
	bsCfgPath   string
	mainCfgPath string
	isDebug     bool
)

const (
	commandName       = "v2-sdk"
	errCreateCli      = "error creating cli for " + commandName + ": %v"
	errSourcingConfig = "error while sourcing config for %s: %v"

	defaultBsConfigPath = "./config/bootstrap-client.yml"
	defaultMainCfgPath  = "./config/main.yml"
	defaultDebug        = true
)

func main() {
	var rootCmd = &cobra.Command{
		Use:   commandName,
		Short: commandName,
	}

	rootCmd.PersistentFlags().BoolVar(&isDebug, "debug", defaultDebug, "debug")
	rootCmd.PersistentFlags().StringVarP(&bsCfgPath, "bootstrap-config-path", "b", defaultBsConfigPath, "bs config path to use")
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
	mainCfg, err := wrapper.NewConfig(mainCfgPath)
	if err != nil {
		logger.Fatalf(errSourcingConfig, "main-wrapper", err)
	}
	bscfg, err := bsSvc.NewConfig(bsCfgPath)
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
	)
	// starts proxy
	if err := rootCmd.Execute(); err != nil {
		log.Fatalf("command failed: %v", err)
	}
}
