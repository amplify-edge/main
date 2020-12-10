package maintemplatev2

import (
	"fmt"
	"github.com/NYTimes/gziphandler"
	bsSvc "github.com/getcouragenow/main/deploy/bootstrapper/service/go"
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2/version"
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2/wrapper"
	discoSvc "github.com/getcouragenow/mod/mod-disco/service/go"
	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
	corebus "github.com/getcouragenow/sys-share/sys-core/service/go/pkg/bus"
	"github.com/getcouragenow/sys/main/pkg"
	grpcMw "github.com/grpc-ecosystem/go-grpc-middleware"
	"github.com/improbable-eng/grpc-web/go/grpcweb"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
	"google.golang.org/grpc"
	"net/http"
	"strings"
)

const (
	errSourcingConfig = "error while sourcing config for %s: %v"
	errCreateService  = "error while creating %s service: %v"

	defaultSysAccountConfigPath = "./config/sysaccount.yml"
	defaultDiscoConfigPath      = "./config/moddisco.yml"
	defaultBsConfigPath         = "./config/bootstrap-server.yml"
	defaultMainCfgPath          = "./config/main.yml"
	defaultDebug                = true
)

var (
	bsCfgPath      string
	mainCfgPath    string
	accountCfgPath string
	discoCfgPath   string
	isDebug        bool
)

type FileSystem struct {
	fs http.FileSystem
}

// Open opens file
func (mfs FileSystem) Open(path string) (http.File, error) {
	f, err := mfs.fs.Open(path)
	if err != nil {
		return nil, err
	}

	s, _ := f.Stat()

	if s.IsDir() {
		index := strings.TrimSuffix(path, "/") + "/index.html"
		if _, err := mfs.fs.Open(index); err != nil {
			return nil, err
		}
	}

	return f, nil
}

func MainServerCommand(system http.FileSystem) *cobra.Command {
	// logging
	log := logrus.New()
	if isDebug {
		log.SetLevel(logrus.DebugLevel)
	} else {
		log.SetLevel(logrus.InfoLevel)
	}
	logger := log.WithField("maintemplate", "v2")

	rootCmd := &cobra.Command{Use: "maintemplatev2"}
	// persistent flags
	rootCmd.PersistentFlags().StringVarP(&accountCfgPath, "sys-account-config-path", "a", defaultSysAccountConfigPath, "sys-account config path to use")
	rootCmd.PersistentFlags().StringVarP(&discoCfgPath, "mod-disco-config-path", "i", defaultDiscoConfigPath, "mod-disco config path to use")
	rootCmd.PersistentFlags().StringVarP(&bsCfgPath, "bootstrap-config-path", "b", defaultBsConfigPath, "bs config path to use")
	rootCmd.PersistentFlags().StringVarP(&mainCfgPath, "main-config-path", "m", defaultMainCfgPath, "main config path to use")
	rootCmd.PersistentFlags().BoolVar(&isDebug, "debug", defaultDebug, "debug")

	rootCmd.RunE = func(cmd *cobra.Command, args []string) error {
		// configs
		mainCfg, err := wrapper.NewConfig(mainCfgPath)
		if err != nil {
			logger.Fatalf(errSourcingConfig, "main-wrapper", err)
		}
		sspaths := pkg.NewServiceConfigPaths(accountCfgPath)
		cbus := corebus.NewCoreBus()
		sscfg, err := pkg.NewSysServiceConfig(logger, nil, sspaths, mainCfg.MainConfig.Port, cbus)
		if err != nil {
			logger.Fatalf(errSourcingConfig, "sys-all", err)
		}
		discocfg, err := discoSvc.NewConfig(discoCfgPath)
		if err != nil {
			logger.Fatalf(errSourcingConfig, "mod-disco", err)
		}
		bscfg, err := bsSvc.NewConfig(bsCfgPath)
		if err != nil {
			logger.Fatalf(errSourcingConfig, "bootstrapper", err)
		}

		mainSvc, err := wrapper.NewMainService(
			logger,
			sscfg,
			cbus,
			mainCfg,
			discocfg,
			bscfg,
		)
		if err != nil {
			logger.Fatalf(errCreateService, "maintemplatev2", err)
		}
		// initiate grpc server
		var grpcServer *grpc.Server
		unaryInterceptors, streamInterceptors := mainSvc.Sys.InjectInterceptors(nil, nil)
		if mainCfg.MainConfig.TLS.Enable && mainCfg.MainConfig.TLS.IsLocal {
			logger.Info("Running server with tls enabled")
			tlsCreds, err := sharedConfig.LoadTLSKeypair(mainCfg.MainConfig.TLS.LocalCertPath, mainCfg.MainConfig.TLS.LocalCertKeyPath)
			if err != nil {
				logger.Fatalf("error loading local tls certificate path and key path: %v", err)
			}
			grpcServer = grpc.NewServer(
				grpc.Creds(tlsCreds),
				grpcMw.WithUnaryServerChain(unaryInterceptors...),
				grpcMw.WithStreamServerChain(streamInterceptors...),
			)
		} else {
			grpcServer = grpc.NewServer(
				grpcMw.WithUnaryServerChain(unaryInterceptors...),
				grpcMw.WithStreamServerChain(streamInterceptors...),
			)
		}
		mainSvc.Sys.RegisterServices(grpcServer)
		mainSvc.Disco.RegisterServices(grpcServer)
		mainSvc.BS.RegisterSvc(grpcServer)
		grpcWebServer := mainSvc.Sys.RegisterGrpcWebServer(grpcServer)
		hostAddr := fmt.Sprintf("%s:%d", mainCfg.MainConfig.HostAddress, mainCfg.MainConfig.Port)
		if mainCfg.MainConfig.IsLocal && mainCfg.MainConfig.TLS.Enable {
			localTlsCertPath := mainCfg.MainConfig.TLS.LocalCertPath
			localTlsKeyPath := mainCfg.MainConfig.TLS.LocalCertKeyPath
			fileServer := http.FileServer(FileSystem{http.Dir(mainCfg.MainConfig.EmbedDir)})
			httpServer := createHttpHandler(logger, false, fileServer, grpcWebServer)
			return mainSvc.Sys.Run(hostAddr, grpcWebServer, httpServer, localTlsCertPath, localTlsKeyPath)
		}
		localTlsCertPath := mainCfg.MainConfig.TLS.LocalCertPath
		localTlsKeyPath := mainCfg.MainConfig.TLS.LocalCertKeyPath
		fileServer := http.FileServer(system)
		httpServer := createHttpHandler(logger, true, fileServer, grpcWebServer)
		return mainSvc.Sys.Run(hostAddr, grpcWebServer, httpServer, localTlsCertPath, localTlsKeyPath)
	}
	b, err := version.Asset("version.json")
	if err != nil {
		logger.Fatalf("unable to open build version information: %v", err)
	}
	buildInfo, err := wrapper.ManifestFromFile(b)
	if err != nil {
		logger.Fatalf("unable to unmarshal build version information: %v", err)
	}
	rootCmd.AddCommand(buildInfo.CobraCommand())
	return rootCmd
}

func createHttpHandler(logger *logrus.Entry, isGzipped bool, fileServer http.Handler, grpcWebServer *grpcweb.WrappedGrpcServer) *http.Server {
	return &http.Server{
		Handler: h2c.NewHandler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			w.Header().Set("Access-Control-Allow-Origin", "*")
			w.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
			w.Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, X-User-Agent, X-Grpc-Web")
			logger.Infof("Serving Endpoint: %s", r.URL.Path)
			if strings.Contains(r.URL.Path, "v2") {
				grpcWebServer.ServeHTTP(w, r)
			} else {
				if isGzipped {
					fileServer = gziphandler.GzipHandler(fileServer)
					fileServer.ServeHTTP(w, r)
				} else {
					fileServer.ServeHTTP(w, r)
				}
			}
		}), &http2.Server{}),
	}
}
