package main

import (
	log "github.com/sirupsen/logrus"

	"github.com/spf13/cobra"

	discoRpc "github.com/getcouragenow/mod/mod-disco/service/go/rpc/v2"
	sysPkg "github.com/getcouragenow/sys-share/sys-account/service/go/pkg"
	corepkg "github.com/getcouragenow/sys-share/sys-core/service/go/pkg"
)

func main() {
	log.Println(" -- sdk cli -- ")

	var rootCmd = &cobra.Command{
		Use:   "maintemplatev2-cli",
		Short: "maintemplate v2",
	}

	accountCli := sysPkg.NewSysShareProxyClient()
	coreProxyCli := corepkg.NewSysCoreProxyClient()
	busProxyCli := corepkg.NewSysBusProxyClient()
	mailProxyCli := corepkg.NewSysMailProxyClient()
	fileProxyCli := corepkg.NewFileServiceClientCommand()

	// load up sys & mod
	rootCmd.AddCommand(discoRpc.SurveyServiceClientCommand(), accountCli.CobraCommand(),
		busProxyCli.CobraCommand(), coreProxyCli.CobraCommand(), mailProxyCli.CobraCommand(), fileProxyCli)
	// starts proxy
	if err := rootCmd.Execute(); err != nil {
		log.Fatalf("command failed: %v", err)
	}
}
