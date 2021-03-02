package main

import (
	"go.amplifyedge.org/main-v2/deploy/templates/maintemplatev2"
	"go.amplifyedge.org/sys-share-v2/sys-core/service/logging/zaplog"
)

func main() {
	logger := zaplog.NewZapLogger(zaplog.WARN, "maintemplatev2", true, "")
	rootCmd := maintemplatev2.MainServerCommand(logger)
	if err := rootCmd.Execute(); err != nil {
		logger.Fatalf("error running maintemplatev2: %v", err)
	}
}
