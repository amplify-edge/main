package pkg

import (
	"github.com/spf13/cobra"
	bscfg "go.amplifyedge.org/main-v2/deploy/bootstrapper/service/go"
	"go.amplifyedge.org/main-v2/deploy/bootstrapper/service/go/pkg/repo"
	bsrpc "go.amplifyedge.org/main-v2/deploy/bootstrapper/service/go/rpc/v2"
	discoRepo "go.amplifyedge.org/mod-v2/mod-disco/service/go/pkg/repo"
	"go.amplifyedge.org/protoc-gen-cobra/client"
	corebus "go.amplifyedge.org/sys-share-v2/sys-core/service/go/pkg/bus"
	"go.amplifyedge.org/sys-share-v2/sys-core/service/logging"
	accountRepo "go.amplifyedge.org/sys-v2/sys-account/service/go/pkg/repo"
	"google.golang.org/grpc"
)

type BootstrapService struct {
	proxyService bsrpc.BSServiceServer
	BsRepo       *repo.BootstrapRepo
}

func NewBootstrapService(cfg *bscfg.BootstrapConfig, l logging.Logger, accRepo *accountRepo.SysAccountRepo, discoRepo *discoRepo.ModDiscoRepo, cc grpc.ClientConnInterface, busClient *corebus.CoreBus) *BootstrapService {
	bsrepo := repo.NewBootstrapRepo(l, cfg.Domain, cfg.SavePath, accRepo, discoRepo, cc, busClient)
	return &BootstrapService{proxyService: bsrepo, BsRepo: bsrepo}
}

func (b *BootstrapService) RegisterSvc(srv *grpc.Server) {
	bsrpc.RegisterBSServiceServer(srv, b.proxyService)
}

func NewBootstrapCLI(bsRepo *repo.BootstrapRepo, option ...client.Option) *cobra.Command {
	rootCmd := bsrpc.BSServiceClientCommand(option...)
	cfg := client.NewConfig(option...)
	rootCmd.AddCommand(bsRepo.GenerateBSBypassCmd(cfg), bsRepo.ExecBSBypassCmd(cfg), bsRepo.NewBootstrapUpload(cfg))
	return rootCmd
}
