package main

import (
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2/wrapper"
	"github.com/sirupsen/logrus"
)

func main() {
	rootCmd := wrapper.MainCliCommand()
	// starts proxy
	if err := rootCmd.Execute(); err != nil {
		logrus.Fatalf("command failed: %v", err)
	}
}
