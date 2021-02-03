package maintemplatev2

import (
	"fmt"
	"github.com/NYTimes/gziphandler"
	"github.com/VictoriaMetrics/metrics"
	bscrypt "github.com/amplify-cms/shared/tool/bs-crypt/lib"
	grpcMw "github.com/grpc-ecosystem/go-grpc-middleware"
	"github.com/improbable-eng/grpc-web/go/grpcweb"
	"github.com/opentracing/opentracing-go"
	"github.com/spf13/cobra"
	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
	"google.golang.org/grpc"
	"net"
	"net/http"
	"os"
	"strings"
	"time"

	"github.com/amplify-cms/sys-share/sys-core/service/logging"
	"github.com/amplify-cms/sys-share/sys-core/service/logging/zaplog"
	"github.com/winwisely268/go-grpc-victoriametrics"

	discoSvc "github.com/amplify-cms/mod/mod-disco/service/go"
	sharedConfig "github.com/amplify-cms/sys-share/sys-core/service/config"
	corebus "github.com/amplify-cms/sys-share/sys-core/service/go/pkg/bus"
	"github.com/amplify-cms/sys-share/sys-core/service/tracing"
	"github.com/amplify-cms/sys/main/pkg"

	bsSvc "github.com/amplify-cms/main/deploy/bootstrapper/service/go"
	"github.com/amplify-cms/main/deploy/templates/maintemplatev2/wrapper"
)

const (
	errSourcingConfig = "error while sourcing config for %s: %v"
	errCreateService  = "error while creating %s service: %v"

	defaultConfigDir                 = "./config"
	defaultEncryptedConfigServerPath = "./encrypted-config"
	defaultDebug                     = false
	defaultCorsHeaders               = "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, X-User-Agent, X-Grpc-Web"
	commonHeaders                    = "Via, X-Forwarded-For, X-Forwarded-Proto, X-Forwarded-SSL, X-Forwarded-Port"
	defaultAppName                   = "maintemplatev2"
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

// Open opens file inside the embedded http filesystem
// it takes the relative path of the index.html
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

func MainServerCommand(system http.FileSystem, version []byte, applogger logging.Logger) *cobra.Command {
	rootCmd := &cobra.Command{Use: "server"}
	// persistent flags
	rootCmd.PersistentFlags().BoolVar(&isDebug, "debug", defaultDebug, "debug")
	rootCmd.PersistentFlags().StringVarP(&encryptedConfigPath, "encrypted-config-dir", "e", defaultEncryptedConfigServerPath, "path to encrypted config directory")
	rootCmd.PersistentFlags().StringVarP(&configPath, "config-output-dir", "c", defaultConfigDir, "path to decrypted config")

	rootCmd.RunE = func(cmd *cobra.Command, args []string) error {
		// server level logging
		var logger *zaplog.ZapLogger
		if isDebug {
			logger = zaplog.NewZapLogger(zaplog.DEBUG, defaultAppName, true, "")
		} else {
			logger = zaplog.NewZapLogger(zaplog.INFO, defaultAppName, false, "")
		}
		logger.InitLogger(nil)
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

		// initiate global tracer
		newTracerCfg := tracing.NewTracerConfig("127.0.0.1:6060", "maintemplatev2")
		globalTracer, closer, err := tracing.NewTracer(newTracerCfg)
		if err != nil {
			logger.Fatal("cannot create tracer", err)
		}
		logger.Info("connect tracer")
		opentracing.SetGlobalTracer(globalTracer)
		defer closer.Close()
		logger.Info("tracer connected")

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
		// currently broken, needs glibc / CGO which we don't want to do.
		//curWorkingDir, _ := os.Getwd()
		//opsMonitor := ops.NewOpsSystemMonitor(cmd.Context(), scrapeInterval, curWorkingDir, logger)
		//
		//go opsMonitor.Run()

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
		applogger.Fatalf("unable to unmarshal build version information: %v", err)
	}
	rootCmd.AddCommand(buildInfo.CobraCommand())
	return rootCmd
}

func createHttpHandler(logger logging.Logger, isGzipped bool, fileServer http.Handler, grpcWebServer *grpcweb.WrappedGrpcServer) *http.Server {
	return &http.Server{
		Handler: h2c.NewHandler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			w.Header().Set("Access-Control-Allow-Origin", "*")
			w.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
			w.Header().Set("Access-Control-Allow-Headers", fmt.Sprintf("%s,%s", defaultCorsHeaders, commonHeaders))
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
