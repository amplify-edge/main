package main

import (
	"go.amplifyedge.org/sys-share-v2/sys-core/service/logging/zaplog"
	"github.com/spf13/cobra"
)

const (
	errSourcingConfig   = "error while sourcing config for %s: %v"
	errCreateSysService = "error while creating sys-* service: %v"

	defaultPort                 = 9075
	defaultSysCoreConfigPath    = "./config/syscore.yml"
	defaultSysAccountConfigPath = "./config/sysaccount.yml"
)

var (
	rootCmd        = &cobra.Command{Use: "mainsys"}
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
	logger := zaplog.NewZapLogger(zaplog.DEBUG, "mainsys", true, "")
	logger.InitLogger(map[string]interface{}{"version": "3"})

	rootCmd.RunE = func(cmd *cobra.Command, args []string) error {
		return nil
	}
	if err := rootCmd.Execute(); err != nil {
		logger.Fatalf("error running sys-main: %v", err)
	}
}
