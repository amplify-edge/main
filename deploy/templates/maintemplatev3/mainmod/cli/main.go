package main

import (
	modpkg "github.com/getcouragenow/mod/main/pkg"
	log "github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
)

func main() {
	rootCmd := &cobra.Command{
		Short: "mainmodv3 cli",
		Use: "mainmodv3 <commands>",
	}
	rootCmd.AddCommand(modpkg.ModCli())
	if err := rootCmd.Execute(); err != nil {
		log.Fatalf("error while running mainmodv3: %v", err)
	}
}
