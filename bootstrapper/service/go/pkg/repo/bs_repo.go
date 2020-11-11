package repo

import (
	discoRepo "github.com/getcouragenow/mod/mod-disco/service/go/pkg/repo"
	discoRpc "github.com/getcouragenow/mod/mod-disco/service/go/rpc/v2"
	sysSharePkg "github.com/getcouragenow/sys-share/sys-account/service/go/pkg"
	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
	accountRepo "github.com/getcouragenow/sys/sys-account/service/go/pkg/repo"
	log "github.com/sirupsen/logrus"
	"google.golang.org/grpc"
	"os"
	"path/filepath"
)

type BootstrapRepo struct {
	savePath    string
	domain      string
	logger      *log.Entry
	accRepo     *accountRepo.SysAccountRepo
	discoRepo   *discoRepo.ModDiscoRepo
	accClient   *sysSharePkg.SysAccountProxyServiceClient // v3 via grpc
	discoClient *discoRpc.SurveyServiceClient             // v3 via grpc
}

func NewBootstrapRepo(logger *log.Entry, domain, savePath string, accRepo *accountRepo.SysAccountRepo, discoRepo *discoRepo.ModDiscoRepo, cc grpc.ClientConnInterface) *BootstrapRepo {
	var accClient *sysSharePkg.SysAccountProxyServiceClient
	var discoClient *discoRpc.SurveyServiceClient
	if cc != nil {
		accClient = sysSharePkg.NewSysAccountProxyServiceClient(cc)
		dc := discoRpc.NewSurveyServiceClient(cc)
		discoClient = &dc
	}
	ex, err := sharedConfig.PathExists(savePath)
	if !ex || err != nil {
		_ = os.MkdirAll(savePath, 0600)
	}
	absPath, err := filepath.Abs(savePath)
	if err != nil {
		logger.Fatalf("unable to create bootstrap repo: %v", err)
	}
	return &BootstrapRepo{
		domain:      domain,
		savePath:    absPath,
		accRepo:     accRepo,
		discoRepo:   discoRepo,
		accClient:   accClient,
		discoClient: discoClient,
	}
}
