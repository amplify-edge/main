package main

import (
	log "github.com/sirupsen/logrus"

	"github.com/spf13/cobra"

	syspkg "github.com/getcouragenow/sys-share/sys-account/service/go/pkg"

	modpkg "github.com/getcouragenow/mod/mod-account/service/go/pkg"
)

func main() {
	log.Println(" -- sdk cli -- ")

	var rootCmd = &cobra.Command{
		Use:   "maintemplatev2-cli",
		Short: "maintemplate v2",
	}

	// load up sys
	spsc := syspkg.NewSysShareProxyClient()
	rootCmd.AddCommand(spsc.CobraCommand())

	// load up mod
	mpsc := modpkg.NewSysShareProxyClient()
	rootCmd.AddCommand(mpsc.CobraCommand())

	// starts proxy
	if err := rootCmd.Execute(); err != nil {
		log.Fatalf("command failed: %v", err)
	}
}
