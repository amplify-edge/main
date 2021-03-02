package maintemplatev2

import (
	"embed"
	"fmt"
	"github.com/NYTimes/gziphandler"
	"github.com/VictoriaMetrics/metrics"
	grpcMw "github.com/grpc-ecosystem/go-grpc-middleware"
	"github.com/improbable-eng/grpc-web/go/grpcweb"
	"github.com/opentracing/opentracing-go"
	"github.com/spf13/cobra"
	bscrypt "go.amplifyedge.org/shared-v2/tool/bs-crypt/lib"
	"go.amplifyedge.org/sys-share-v2/sys-core/service/certutils"
	accountpkg "go.amplifyedge.org/sys-v2/sys-account/service/go/pkg"
	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
	"google.golang.org/grpc"
	"net"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"time"

	"github.com/winwisely268/go-grpc-victoriametrics"
	"go.amplifyedge.org/sys-share-v2/sys-core/service/logging"
	"go.amplifyedge.org/sys-share-v2/sys-core/service/logging/zaplog"

	corebus "go.amplifyedge.org/sys-share-v2/sys-core/service/go/pkg/bus"
	"go.amplifyedge.org/sys-share-v2/sys-core/service/tracing"
	"go.amplifyedge.org/sys-v2/main/pkg"

	"go.amplifyedge.org/main-v2/deploy/templates/maintemplatev2/wrapper"
)

//go:embed version/manifest.json
var versionFile []byte

//go:embed client/build/web/*
var assets embed.FS

const (
	errSourcingConfig = "error while sourcing config for %s: %v"
	errCreateService  = "error while creating %s service: %v"

	defaultConfigDir                 = "./config"
	defaultEncryptedConfigServerPath = "./encrypted-config"
	defaultDebug                     = true
	defaultCorsHeaders               = "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, X-User-Agent, X-Grpc-Web"
	commonHeaders                    = "Via, X-Forwarded-For, X-Forwarded-Proto, X-Forwarded-SSL, X-Forwarded-Port"
	defaultAppName                   = "maintemplatev2"
)

var (
	configPath          string
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

func MainServerCommand(applogger logging.Logger) *cobra.Command {
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

		serverConfig := filepath.Join(configPath, "config-server.yml")

		mainCfg, err := wrapper.NewServerConfig(serverConfig)
		if err != nil {
			logger.Fatalf(errSourcingConfig, "main-wrapper", err)
		}
		cbus := corebus.NewCoreBus()
		accountSvcCfg, err := accountpkg.NewSysAccountServiceConfig(logger, "", cbus, &mainCfg.SysAccountConfig)
		if err != nil {
			logger.Fatal("unable to create sys-account config", err)
		}
		sspaths := pkg.NewServiceConfigPaths("", accountSvcCfg)
		sscfg, err := pkg.NewSysServiceConfig(logger, nil, sspaths, mainCfg.MainConfigServer.Port, cbus)
		if err != nil {
			logger.Fatalf(errSourcingConfig, "sys-all", err)
		}
		discocfg := mainCfg.ModDiscoConfig
		bscfg := mainCfg.BootstrapConfig

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
			&mainCfg.MainConfigServer,
			&discocfg,
			&bscfg,
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
		if mainCfg.MainConfigServer.TLS.Enable && mainCfg.MainConfigServer.TLS.IsLocal {
			logger.Info("Running local server with tls enabled")
			tlsCreds, err := certutils.LoadTLSKeypair(mainCfg.MainConfigServer.TLS.LocalCertPath, mainCfg.MainConfigServer.TLS.LocalCertKeyPath)
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
		hostAddr := fmt.Sprintf("%s:%d", mainCfg.MainConfigServer.HostAddress, mainCfg.MainConfigServer.Port)
		if mainCfg.MainConfigServer.IsLocal && mainCfg.MainConfigServer.TLS.Enable {
			localTlsCertPath := mainCfg.MainConfigServer.TLS.LocalCertPath
			localTlsKeyPath := mainCfg.MainConfigServer.TLS.LocalCertKeyPath
			fileServer := http.FileServer(FileSystem{http.Dir(mainCfg.MainConfigServer.EmbedDir)})
			httpServer := createHttpHandler(logger, false, fileServer, grpcWebServer)
			return mainSvc.Sys.Run(hostAddr, grpcWebServer, httpServer, localTlsCertPath, localTlsKeyPath)
			// } else if !mainCfg.MainConfigServer.IsLocal && mainCfg.MainConfigServer.TLS.Enable {
		} else {
			fileServer := http.FileServer(http.FS(assets))
			fileServer = http.StripPrefix("/client/build/web", fileServer)
			httpServer := createHttpHandler(logger, true, fileServer, grpcWebServer)
			listener, err := net.Listen("tcp", fmt.Sprintf(":%d", mainCfg.MainConfigServer.Port))
			if err != nil {
				return err
			}
			return httpServer.Serve(listener)
			// return mainSvc.Sys.Run(hostAddr, grpcWebServer, httpServer, "", "")
		}
	}

	buildInfo, err := wrapper.ManifestFromFile(versionFile)
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
