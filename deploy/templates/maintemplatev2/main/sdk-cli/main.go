package main

import (
	"github.com/sirupsen/logrus"

	"github.com/getcouragenow/main/deploy/templates/maintemplatev2"
)

func main() {
	rootCmd := maintemplatev2.MainCliCommand()
	// starts proxy
	if err := rootCmd.Execute(); err != nil {
		logrus.Fatalf("command failed: %v", err)
	}
}
