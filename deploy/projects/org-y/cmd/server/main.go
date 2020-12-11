package main

import (
	"github.com/getcouragenow/main/deploy/projects/org-y/version"
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2"
	"github.com/sirupsen/logrus"
)

func main() {
	b, err := version.Asset("manifest.json")
	if err != nil {
		logrus.Fatalf("unable to open build version information: %v", err)
	}
	serverCmd := maintemplatev2.MainServerCommand(AssetFile(), b)
	if err := serverCmd.Execute(); err != nil {
		logrus.Fatalf("error running maintemplatev2: %v", err)
	}
}
