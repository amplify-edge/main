package repo

import (
	bsrpc "go.amplifyedge.org/main-v2/deploy/bootstrapper/service/go/rpc/v2"
	discoRepo "go.amplifyedge.org/mod-v2/mod-disco/service/go/pkg/repo"
	discoRpc "go.amplifyedge.org/mod-v2/mod-disco/service/go/rpc/v2"
	accountRpc "go.amplifyedge.org/sys-share-v2/sys-account/service/go/rpc/v2"
	"go.amplifyedge.org/sys-share-v2/sys-core/service/fileutils"
	corebus "go.amplifyedge.org/sys-share-v2/sys-core/service/go/pkg/bus"
	"go.amplifyedge.org/sys-share-v2/sys-core/service/logging"
	accountRepo "go.amplifyedge.org/sys-v2/sys-account/service/go/pkg/repo"
	"google.golang.org/grpc"
	"os"
	"path/filepath"
)

type BootstrapRepo struct {
	savePath       string
	activeFilePath string
	domain         string
	logger         logging.Logger
	accRepo        *accountRepo.SysAccountRepo
	discoRepo      *discoRepo.ModDiscoRepo
	authClient     accountRpc.AuthServiceClient
	accClient      accountRpc.AccountServiceClient // v3 via grpc
	discoClient    discoRpc.SurveyServiceClient    // v3 via grpc
	orgClient      accountRpc.OrgProjServiceClient // v3 via grpc
	busClient      *corebus.CoreBus
	*bsrpc.UnimplementedBSServiceServer
}

func NewBootstrapRepo(logger logging.Logger, domain, savePath string, accRepo *accountRepo.SysAccountRepo, discoRepo *discoRepo.ModDiscoRepo, cc grpc.ClientConnInterface, busClient *corebus.CoreBus) *BootstrapRepo {
	if cc == nil && accRepo == nil && discoRepo == nil {
		logger.Fatalf("invalid bootstrap repo argument: all repos and clients are nil")
	}
	var accClient accountRpc.AccountServiceClient
	var orgClient accountRpc.OrgProjServiceClient
	var authClient accountRpc.AuthServiceClient
	var discoClient discoRpc.SurveyServiceClient
	if cc != nil {
		accClient = accountRpc.NewAccountServiceClient(cc)
		authClient = accountRpc.NewAuthServiceClient(cc)
		orgClient = accountRpc.NewOrgProjServiceClient(cc)
		dc := discoRpc.NewSurveyServiceClient(cc)
		discoClient = dc
	}
	ex, err := fileutils.PathExists(savePath)
	if !ex || err != nil {
		_ = os.MkdirAll(savePath, 0755)
	}
	absPath, err := filepath.Abs(savePath)
	if err != nil {
		logger.Fatalf("unable to create bootstrap repo: %v", err)
	}
	// create new .active file that contains the name of currently active bootstrap
	activeFilePath := filepath.Join(absPath, ".active")
	_, err = os.OpenFile(activeFilePath, os.O_RDWR|os.O_CREATE, 0660)
	if err != nil {
		logger.Fatalf("unable to create bootstrap repo: %v", err)
	}
	return &BootstrapRepo{
		domain:         domain,
		savePath:       absPath,
		accRepo:        accRepo,
		discoRepo:      discoRepo,
		authClient:     authClient,
		orgClient:      orgClient,
		accClient:      accClient,
		discoClient:    discoClient,
		busClient:      busClient,
		activeFilePath: activeFilePath,
	}
}

func (b *BootstrapRepo) ChangeInterceptor(cc grpc.ClientConnInterface) {
	accClient := accountRpc.NewAccountServiceClient(cc)
	authClient := accountRpc.NewAuthServiceClient(cc)
	orgClient := accountRpc.NewOrgProjServiceClient(cc)
	dc := discoRpc.NewSurveyServiceClient(cc)
	discoClient := dc
	b.accClient = accClient
	b.discoClient = discoClient
	b.authClient = authClient
	b.orgClient = orgClient
}
