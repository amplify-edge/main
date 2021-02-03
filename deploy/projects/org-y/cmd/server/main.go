package main

import (
	"github.com/amplify-cms/main/deploy/projects/org-y/version"
	"github.com/amplify-cms/main/deploy/templates/maintemplatev2"
	"github.com/amplify-cms/sys-share/sys-core/service/logging/zaplog"
)

func main() {
	logger := zaplog.NewZapLogger(zaplog.WARN, "maintemplatev2", false, "")
	b, err := version.Asset("manifest.json")
	if err != nil {
		logger.Fatalf("unable to open build version information: %v", err)
	}
	rootCmd := maintemplatev2.MainServerCommand(AssetFile(), b, logger)
	if err = rootCmd.Execute(); err != nil {
		logger.Fatalf("error running maintemplatev2: %v", err)
	}
}
