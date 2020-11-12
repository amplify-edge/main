package wrapper

import (
	"github.com/spf13/cobra"

	bsPkg "github.com/getcouragenow/main/bootstrapper/service/go/pkg"
	discoPkg "github.com/getcouragenow/mod/mod-disco/service/go/pkg"
	corebus "github.com/getcouragenow/sys-share/sys-core/service/go/pkg/bus"
	// discoRpc "github.com/getcouragenow/mod/mod-disco/service/go/rpc/v2"
	sysSharePkg "github.com/getcouragenow/sys-share/sys-account/service/go/pkg"
	sysCorePkg "github.com/getcouragenow/sys-share/sys-core/service/go/pkg"
	sysPkg "github.com/getcouragenow/sys/main/pkg"
)

type MainService struct {
	Sys   *sysPkg.SysServices
	Disco *discoPkg.ModDiscoService
	BS    *bsPkg.BootstrapService
}

type MainSdkCli struct {
	SysAccount *sysSharePkg.SysAccountProxyClient
	SysCore    *sysCorePkg.SysCoreProxyClient
	SysMail *sysCorePkg.SysMailProxyClient
	SysBus *sysCorePkg.SysBusProxyClient
	ModDisco *cobra.Command
}

func NewMain(sysConfigPaths *sysPkg.ServiceConfigPaths, bus *corebus.CoreBus)