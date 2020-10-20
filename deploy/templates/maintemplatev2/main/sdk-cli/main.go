package main

import (
	log "github.com/sirupsen/logrus"

	"github.com/spf13/cobra"

	modpkg "github.com/getcouragenow/mod/mod-dummy/service/go/pkg"
)

func main() {
	log.Println(" -- sdk cli -- ")

	var rootCmd = &cobra.Command{
		Use:   "maintemplatev2-cli",
		Short: "maintemplate v2",
	}

	// load up sys & mod
	mpsc := modpkg.NewModDummyProxyClient()

	rootCmd.AddCommand(mpsc.CobraCommand())
	// starts proxy
	if err := rootCmd.Execute(); err != nil {
		log.Fatalf("command failed: %v", err)
	}
}
