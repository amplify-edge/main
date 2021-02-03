package main

import (
	"github.com/amplify-cms/sys-share/sys-core/service/logging/zaplog"

	"github.com/spf13/cobra"
)

func main() {
	l := zaplog.NewZapLogger(zaplog.DEBUG, "mainmod", true, "")
	l.InitLogger(map[string]interface{}{"version": "3"})

	rootCmd := &cobra.Command{
		Short: "mainmodv3 cli",
		Use: "mainmodv3 <commands>",
	}
	// rootCmd.AddCommand(modpkg.ModCli())
	if err := rootCmd.Execute(); err != nil {
		l.Fatalf("error while running mainmodv3: %v", err)
	}
}
