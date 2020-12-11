package main

import (
	"github.com/sirupsen/logrus"

	"github.com/getcouragenow/main/deploy/projects/org-y/version"
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2"
)

func main() {
	b, err := version.Asset("manifest.json")
	if err != nil {
		logrus.Fatalf("unable to open build version information: %v", err)
	}
	cliCmd := maintemplatev2.MainCliCommand(b)
	if err := cliCmd.Execute(); err != nil {
		logrus.Fatalf("error running maintemplatev2: %v", err)
	}
}
