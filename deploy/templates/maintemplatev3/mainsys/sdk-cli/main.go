package main

import (
	//"go.amplifyedge.org/sys-share-v2/pkg"
	// FIX IS:
	"go.amplifyedge.org/sys-share-v2/sys-account/service/go/pkg"
	"go.amplifyedge.org/sys-share-v2/sys-core/service/logging/zaplog"
)

func main() {
	l := zaplog.NewZapLogger(zaplog.DEBUG, "mainmod", true, "")
	l.InitLogger(map[string]interface{}{"version": "3"})

	// load up sdk cli
	spsc := pkg.NewSysShareProxyClient()
	rootCmd := spsc.CobraCommand()

	// starts proxy
	if err := rootCmd.Execute(); err != nil {
		l.Fatalf("command failed: %v", err)
	}
}
