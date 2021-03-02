package main

import (
	"go.amplifyedge.org/main-v2/deploy/templates/maintemplatev2"
)

func main() {
	rootCmd, logger := maintemplatev2.MainCliCommand()
	// starts proxy
	if err := rootCmd.Execute(); err != nil {
		logger.Fatalf("command failed: %v", err)
	}
}
