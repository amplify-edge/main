package main

import (
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2/wrapper"
	"github.com/sirupsen/logrus"
)

func main() {
	rootCmd := wrapper.MainServerCommand(AssetFile())
	if err := rootCmd.Execute(); err != nil {
		logrus.Fatalf("error running maintemplatev2: %v", err)
	}
}
