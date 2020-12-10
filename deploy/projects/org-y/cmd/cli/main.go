package main

import (
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2"
	"github.com/sirupsen/logrus"
)

func main() {
	rootCmd := maintemplatev2.MainCliCommand()
	if err := rootCmd.Execute(); err != nil {
		logrus.Fatalf("error running maintemplatev2: %v", err)
	}
}