package main

import (
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2"
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2/version"
	"log"
)

func main() {
	b, err := version.Asset("manifest.json")
	if err != nil {
		log.Fatalf("unable to open build version information: %v", err)
	}
	rootCmd, logger := maintemplatev2.MainServerCommand(nil, b)
	if err := rootCmd.Execute(); err != nil {
		logger.Fatalf("error running maintemplatev2: %v", err)
	}
}
