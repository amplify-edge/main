package main

import (
	"github.com/sirupsen/logrus"

	"github.com/getcouragenow/main/deploy/templates/maintemplatev2"
)

func main() {
	rootCmd := maintemplatev2.MainServerCommand(AssetFile())
	if err := rootCmd.Execute(); err != nil {
		logrus.Fatalf("error running maintemplatev2: %v", err)
	}
}
