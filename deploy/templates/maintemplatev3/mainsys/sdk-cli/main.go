package main

import (
	//"github.com/getcouragenow/sys-share/pkg"
	// FIX IS:
	"github.com/getcouragenow/sys-share/sys-account/service/go/pkg"
	"github.com/getcouragenow/sys-share/sys-core/service/logging/zaplog"
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
