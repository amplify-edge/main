package maintemplatev2

import (
	"fmt"
	"github.com/NYTimes/gziphandler"
	"github.com/VictoriaMetrics/metrics"
	bscrypt "github.com/getcouragenow/ops/bs-crypt/lib"
	grpcMw "github.com/grpc-ecosystem/go-grpc-middleware"
	"github.com/improbable-eng/grpc-web/go/grpcweb"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
	"google.golang.org/grpc"
	"net"
	"net/http"
	"os"
	"strings"
	"time"

	"github.com/winwisely268/go-grpc-victoriametrics"

	discoSvc "github.com/getcouragenow/mod/mod-disco/service/go"
	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
	corebus "github.com/getcouragenow/sys-share/sys-core/service/go/pkg/bus"
	"github.com/getcouragenow/sys-share/sys-core/service/telemetry/ops"
	"github.com/getcouragenow/sys/main/pkg"

	bsSvc "github.com/getcouragenow/main/deploy/bootstrapper/service/go"
	"github.com/getcouragenow/main/deploy/templates/maintemplatev2/wrapper"
)

const (
	errSourcingConfig = "error while sourcing config for %s: %v"
	errCreateService  = "error while creating %s service: %v"

	defaultConfigDir                 = "./config"
	defaultEncryptedConfigServerPath = "./encrypted-config"
	defaultDebug                     = true
	defaultCorsHeaders               = "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, X-User-Agent, X-Grpc-Web"
	flyHeaders                       = "Fly-Client-IP, Fly-Forwarded-Port, Fly-Region, Via, X-Forwarded-For, X-Forwarded-Proto, X-Forwarded-SSL, X-Forwarded-Port"
)

var (
	configPath string

	isDebug             bool
	encryptedConfigPath string
)

const (
	scrapeInterval = 10 * time.Second
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

func MainServerCommand(system http.FileSystem, version []byte) *cobra.Command {
	// logging
	log := logrus.New()
	if isDebug {
		log.SetLevel(logrus.DebugLevel)
	} else {
		log.SetLevel(logrus.InfoLevel)
	}
	logger := log.WithField("maintemplate", "v2")

	rootCmd := &cobra.Command{Use: "server"}
	// persistent flags
	rootCmd.PersistentFlags().BoolVar(&isDebug, "debug", defaultDebug, "debug")
	rootCmd.PersistentFlags().StringVarP(&encryptedConfigPath, "encrypted-config-dir", "e", defaultEncryptedConfigServerPath, "path to encrypted config directory")
	rootCmd.PersistentFlags().StringVarP(&configPath, "config-output-dir", "c", defaultConfigDir, "path to decrypted config")

	rootCmd.RunE = func(cmd *cobra.Command, args []string) error {
		// encrypted configs
		password := os.Getenv("CONFIG_PASSWORD")
		if password == "" {
			logger.Fatal("unable to get config secret from the environment")
		}
		err := bscrypt.DecryptAllFiles(encryptedConfigPath, configPath, password)
		if err != nil {
			logger.Fatal("unable to decrypt config: %v", err)
		}
		bsCfgPath := configPath + "/bootstrap-server.yml"
		mainCfgPath := configPath + "/main-server.yml"
		accountCfgPath := configPath + "/sysaccount.yml"
		discoCfgPath := configPath + "/moddisco.yml"
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

		// initiate application level monitoring
		curWorkingDir, _ := os.Getwd()
		opsMonitor := ops.NewOpsSystemMonitor(cmd.Context(), scrapeInterval, curWorkingDir, logger)

		go opsMonitor.Run()

		// initiate grpc server
		var grpcServer *grpc.Server
		unaryInterceptors, streamInterceptors := mainSvc.Sys.InjectInterceptors(nil, nil)
		unaryInterceptors = append(unaryInterceptors, grpc_victoriametrics.UnaryServerInterceptor)
		streamInterceptors = append(streamInterceptors, grpc_victoriametrics.StreamServerInterceptor)
		if mainCfg.MainConfig.TLS.Enable && mainCfg.MainConfig.TLS.IsLocal {
			logger.Info("Running local server with tls enabled")
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
		grpc_victoriametrics.Register(false, grpcServer)
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
			// } else if !mainCfg.MainConfig.IsLocal && mainCfg.MainConfig.TLS.Enable {
		} else {
			fileServer := http.FileServer(system)
			httpServer := createHttpHandler(logger, true, fileServer, grpcWebServer)
			listener, err := net.Listen("tcp", fmt.Sprintf(":%d", mainCfg.MainConfig.Port))
			if err != nil {
				return err
			}
			return httpServer.Serve(listener)
			// return mainSvc.Sys.Run(hostAddr, grpcWebServer, httpServer, "", "")
		}
	}

	buildInfo, err := wrapper.ManifestFromFile(version)
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
			w.Header().Set("Access-Control-Allow-Headers", fmt.Sprintf("%s,%s", defaultCorsHeaders, flyHeaders))
			logger.Infof("Serving Endpoint: %s", r.URL.Path)
			ct := r.Header.Get("Content-Type")
			if grpcWebServer.IsGrpcWebSocketRequest(r) || grpcWebServer.IsGrpcWebRequest(r) || grpcWebServer.IsAcceptableGrpcCorsRequest(r) || strings.Contains(ct, "application/grpc") {
				grpcWebServer.ServeHTTP(w, r)
			} else if r.URL.RequestURI() == "/metrics" {
				metricsHandler(w, r)
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

func metricsHandler(w http.ResponseWriter, _ *http.Request) {
	metrics.WritePrometheus(w, true)
}
