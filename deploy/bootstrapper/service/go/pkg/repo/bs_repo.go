package repo

import (
	discoRepo "github.com/amplify-cms/mod/mod-disco/service/go/pkg/repo"
	discoRpc "github.com/amplify-cms/mod/mod-disco/service/go/rpc/v2"
	sysSharePkg "github.com/amplify-cms/sys-share/sys-account/service/go/pkg"
	sharedConfig "github.com/amplify-cms/sys-share/sys-core/service/config"
	corebus "github.com/amplify-cms/sys-share/sys-core/service/go/pkg/bus"
	"github.com/amplify-cms/sys-share/sys-core/service/logging"
	accountRepo "github.com/amplify-cms/sys/sys-account/service/go/pkg/repo"
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
	accClient      *sysSharePkg.SysAccountProxyServiceClient // v3 via grpc
	discoClient    discoRpc.SurveyServiceClient              // v3 via grpc
	busClient      *corebus.CoreBus
}

func NewBootstrapRepo(logger logging.Logger, domain, savePath string, accRepo *accountRepo.SysAccountRepo, discoRepo *discoRepo.ModDiscoRepo, cc grpc.ClientConnInterface, busClient *corebus.CoreBus) *BootstrapRepo {
	if cc == nil && accRepo == nil && discoRepo == nil {
		logger.Fatalf("invalid bootstrap repo argument: all repos and clients are nil")
	}
	var accClient *sysSharePkg.SysAccountProxyServiceClient
	var discoClient discoRpc.SurveyServiceClient
	if cc != nil {
		accClient = sysSharePkg.NewSysAccountProxyServiceClient(cc)
		dc := discoRpc.NewSurveyServiceClient(cc)
		discoClient = dc
	}
	ex, err := sharedConfig.PathExists(savePath)
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
		accClient:      accClient,
		discoClient:    discoClient,
		busClient:      busClient,
		activeFilePath: activeFilePath,
	}
}

func (b *BootstrapRepo) ChangeInterceptor(cc grpc.ClientConnInterface) {
	accClient := sysSharePkg.NewSysAccountProxyServiceClient(cc)
	dc := discoRpc.NewSurveyServiceClient(cc)
	discoClient := dc
	b.accClient = accClient
	b.discoClient = discoClient
}
