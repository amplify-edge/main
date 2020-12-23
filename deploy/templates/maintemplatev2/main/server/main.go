package main

import (
	"github.com/sirupsen/logrus"

	"github.com/getcouragenow/main/deploy/templates/maintemplatev2"
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2/version"
)

func main() {
	b, err := version.Asset("manifest.json")
	if err != nil {
		logrus.Fatalf("unable to open build version information: %v", err)
	}
	rootCmd := maintemplatev2.MainServerCommand(nil, b)
	if err := rootCmd.Execute(); err != nil {
		logrus.Fatalf("error running maintemplatev2: %v", err)
	}
}
