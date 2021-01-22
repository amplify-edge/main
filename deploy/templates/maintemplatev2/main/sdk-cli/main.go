package main

import (
	"log"

	"github.com/getcouragenow/main/deploy/templates/maintemplatev2"
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2/version"
)

func main() {
	b, err := version.Asset("manifest.json")
	if err != nil {
		log.Fatalf("unable to open build version information: %v", err)
	}
	rootCmd, logger := maintemplatev2.MainCliCommand(b)
	// starts proxy
	if err := rootCmd.Execute(); err != nil {
		logger.Fatalf("command failed: %v", err)
	}
}
