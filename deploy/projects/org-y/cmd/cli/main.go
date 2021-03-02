package main

import (
	"go.amplifyedge.org/main-v2/deploy/projects/org-y/version"
	"go.amplifyedge.org/main-v2/deploy/templates/maintemplatev2"
	"log"
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
