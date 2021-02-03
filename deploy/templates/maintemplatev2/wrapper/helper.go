package wrapper

import (
	"context"
	"fmt"
	"time"

	"github.com/amplify-cms/sys-share/sys-core/service/clihelper"
	"github.com/amplify-cms/sys-share/sys-core/service/logging"

	"github.com/spf13/cobra"
	"google.golang.org/grpc"

	bscfg "github.com/amplify-cms/main/deploy/bootstrapper/service/go"
	bsPkg "github.com/amplify-cms/main/deploy/bootstrapper/service/go/pkg"
	discoSvc "github.com/amplify-cms/mod/mod-disco/service/go"
	discoPkg "github.com/amplify-cms/mod/mod-disco/service/go/pkg"
	discoRpc "github.com/amplify-cms/mod/mod-disco/service/go/rpc/v2"
	sysSharePkg "github.com/amplify-cms/sys-share/sys-account/service/go/pkg"
	sharedConfig "github.com/amplify-cms/sys-share/sys-core/service/config"
	sysCorePkg "github.com/amplify-cms/sys-share/sys-core/service/go/pkg"
	corebus "github.com/amplify-cms/sys-share/sys-core/service/go/pkg/bus"
	sysPkg "github.com/amplify-cms/sys/main/pkg"
	"github.com/amplify-cms/sys/sys-core/service/go/pkg/coredb"
)

const (
	defaultTimeout      = 5 * time.Second
	errSourcingConfig   = "error while sourcing config for %s: %v"
	errCreateSysService = "error while creating sys-%s service: %v"
	errCreateModService = "error while creating mod-%s service: %v"
)

type MainService struct {
	Sys   *sysPkg.SysServices
	Disco *discoPkg.ModDiscoService
	BS    *bsPkg.BootstrapService
}

type MainSdkCli struct {
	SysAccount   *sysSharePkg.SysAccountProxyClient
	SysCore      *sysCorePkg.SysCoreProxyClient
	SysMail      *sysCorePkg.SysMailProxyClient
	SysBus       *sysCorePkg.SysBusProxyClient
	ModDisco     *cobra.Command
	BootstrapCLI *cobra.Command
}

func NewMainService(
	logger logging.Logger,
	sscfg *sysPkg.SysServiceConfig,
	cbus *corebus.CoreBus,
	mainCfg *MainConfig,
	discocfg *discoSvc.ModDiscoConfig,
	bsconfig *bscfg.BootstrapConfig,
) (*MainService, error) {
	discodb, err := coredb.NewCoreDB(logger, &discocfg.ModDiscoConfig.SysCoreConfig, nil)
	if err != nil {
		logger.Fatalf("error creating mod-disco database: %v", err)
	}
	var clientConn *grpc.ClientConn
	var dialOpts grpc.DialOption
	// cli options
	hostPort := fmt.Sprintf("%s:%d", mainCfg.MainConfig.HostAddress, mainCfg.MainConfig.Port)
	ctx, cancel := context.WithTimeout(context.Background(), defaultTimeout)
	defer cancel()

	if mainCfg.MainConfig.TLS.Enable {
		creds, err := sharedConfig.ClientLoadCA(mainCfg.MainConfig.TLS.RootCAPath)
		if err != nil {
			return nil, fmt.Errorf("unable to load CA Root path: %v", err)
		}
		dialOpts = grpc.WithTransportCredentials(creds)
	} else {
		dialOpts = grpc.WithInsecure()
	}
	clientConn, err = grpc.DialContext(
		ctx,
		hostPort,
		dialOpts,
	)

	if err != nil {
		return nil, fmt.Errorf("unable to create new client conn: %v", err)
	}
	// initiate all sys-* service
	sysSvc, err := sysPkg.NewService(sscfg, mainCfg.MainConfig.Domain)
	if err != nil {
		return nil, fmt.Errorf(errCreateSysService, "all", err)
	}

	discoSvcCfg, err := discoPkg.NewModDiscoServiceConfig(
		logger, discodb, discocfg, cbus, clientConn,
		// logger, discodb, discocfg, cbus, nil,
	)
	if err != nil {
		return nil, fmt.Errorf(errCreateModService, "disco", err)
	}
	modDiscoSvc, err := discoPkg.NewModDiscoService(discoSvcCfg, sysSvc.SysAccountSvc.AllDBs)
	if err != nil {
		return nil, fmt.Errorf(errCreateModService, "disco", err)
	}

	bsService := bsPkg.NewBootstrapService(
		bsconfig,
		logger,
		sysSvc.SysAccountSvc.AuthRepo,
		modDiscoSvc.ModDiscoRepo,
		// clientConn,
		nil,
		cbus,
	)

	ms := &MainService{
		Sys:   sysSvc,
		Disco: modDiscoSvc,
		BS:    bsService,
	}
	return ms, nil
}

func NewMainCLI(
	logger logging.Logger,
	mainCfg *MainConfig,
	bsconfig *bscfg.BootstrapConfig,
	cbus *corebus.CoreBus,
) (*MainSdkCli, error) {
	var clientConn *grpc.ClientConn
	dialOpts := []grpc.DialOption{grpc.WithBlock()}
	// cli options
	var cliOpts *clihelper.CLIOptions

	hostPort := fmt.Sprintf("%s:%d", mainCfg.MainConfig.HostAddress, mainCfg.MainConfig.Port)
	ctx, cancel := context.WithTimeout(context.Background(), defaultTimeout)
	defer cancel()

	if !mainCfg.MainConfig.IsLocal && mainCfg.MainConfig.TLS.Enable {
		err := sharedConfig.DownloadCACert(mainCfg.MainConfig.TLS.RootCAPath, mainCfg.MainConfig.Domain)
		creds, err := sharedConfig.ClientLoadCA(mainCfg.MainConfig.TLS.RootCAPath)
		if err != nil {
			return nil, fmt.Errorf("unable to load CA from domain: %s => %v", mainCfg.MainConfig.Domain, err)
		}
		dialOpts = append(dialOpts, grpc.WithTransportCredentials(creds))
		cliOpts = clihelper.CLIWrapper(mainCfg.MainConfig.TLS.RootCAPath, hostPort, ".env")
	} else if mainCfg.MainConfig.TLS.Enable && mainCfg.MainConfig.IsLocal {
		creds, err := sharedConfig.ClientLoadCA(mainCfg.MainConfig.TLS.RootCAPath)
		if err != nil {
			return nil, fmt.Errorf("unable to load CA Root path: %v", err)
		}
		dialOpts = append(dialOpts, grpc.WithTransportCredentials(creds))
		cliOpts = clihelper.CLIWrapper(mainCfg.MainConfig.TLS.RootCAPath, hostPort, ".env")
	} else {
		dialOpts = append(dialOpts, grpc.WithInsecure())
		cliOpts = clihelper.CLIWrapper("", hostPort, ".env")
	}
	clientOptions := cliOpts.GetAllOptions()
	cliOpts.RegisterAuthDialer()
	var err error
	clientConn, err = grpc.DialContext(
		ctx,
		hostPort,
		dialOpts...,
	)
	if err != nil {
		return nil, fmt.Errorf("unable to create new client conn: %v", err)
	}

	bsService := bsPkg.NewBootstrapService(
		bsconfig,
		logger,
		nil,
		nil,
		clientConn,
		cbus,
	)
	sysSharePkg.NewSysShareProxyClient(clientOptions...)

	bootstrapCli := bsPkg.NewBootstrapCLI(bsService.BsRepo, clientOptions...)
	mcli := &MainSdkCli{
		SysAccount:   sysSharePkg.NewSysShareProxyClient(clientOptions...),
		SysCore:      sysCorePkg.NewSysCoreProxyClient(clientOptions...),
		SysMail:      sysCorePkg.NewSysMailProxyClient(clientOptions...),
		SysBus:       sysCorePkg.NewSysBusProxyClient(clientOptions...),
		ModDisco:     discoRpc.SurveyServiceClientCommand(clientOptions...),
		BootstrapCLI: bootstrapCli,
	}
	return mcli, nil
}
