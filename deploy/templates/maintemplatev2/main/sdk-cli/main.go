package main

import (
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2"
	"github.com/sirupsen/logrus"
)

func main() {
	rootCmd := maintemplatev2.MainCliCommand()
	// starts proxy
	if err := rootCmd.Execute(); err != nil {
		logrus.Fatalf("command failed: %v", err)
	}
}
