package main

import (
	"github.com/getcouragenow/main/deploy/projects/org-y/version"
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
)

func main() {
	b, err := version.Asset("manifest.json")
	if err != nil {
		logrus.Fatalf("unable to open build version information: %v", err)
	}
	rootCmd := &cobra.Command{
		Use:   "org-y",
		Short: "org-y server | cli",
	}
	serverCmd := maintemplatev2.MainServerCommand(AssetFile(), b)
	cliCmd := maintemplatev2.MainCliCommand(b)
	rootCmd.AddCommand(
		serverCmd,
		cliCmd,
	)
	if err := rootCmd.Execute(); err != nil {
		logrus.Fatalf("error running maintemplatev2: %v", err)
	}
}
