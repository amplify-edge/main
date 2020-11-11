package main

import (
	"context"
	"fmt"
	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
	corebus "github.com/getcouragenow/sys-share/sys-core/service/go/pkg/bus"
	"github.com/getcouragenow/sys/sys-core/service/go/pkg/coredb"
	grpcMw "github.com/grpc-ecosystem/go-grpc-middleware"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
	"google.golang.org/grpc"
	"net/http"
	"strings"
	"time"

	discoSvc "github.com/getcouragenow/mod/mod-disco/service/go"
	discoPkg "github.com/getcouragenow/mod/mod-disco/service/go/pkg"
	"github.com/getcouragenow/sys/main/pkg"
)

const (
	errSourcingConfig   = "error while sourcing config for %s: %v"
	errCreateSysService = "error while creating sys-* service: %v"

	defaultPort                 = 9074
	defaultSysCoreConfigPath    = "./config/syscore.yml"
	defaultSysAccountConfigPath = "./config/sysaccount.yml"
	defaultDiscoConfigPath      = "./config/moddisco.yml"
	defaultLocal                = true
	defaultStaticDir            = "./client/build/web"
	defaultLocalTLSCert         = "./certs/local.pem"
	defaultLocalTLSKey          = "./certs/local.key.pem"
	defaultCARootPath           = "./certs/rootca.pem"
	defaultTlsEnabled           = true
	defaultTimeout              = 5 * time.Second
	defaultSysFileConfigPath    = "./config/sysfile.yml"
)

var (
	rootCmd          = &cobra.Command{Use: "maintemplatev2"}
	localTlsCertPath string
	localTlsKeyPath  string
	localRootCAPath  string
	coreCfgPath      string
	fileCfgPath      string
	accountCfgPath   string
	discoCfgPath     string
	mainexPort       int
	local            bool
	staticDir        string
	tlsEnabled       bool
)

func main() {
	// persistent flags
	rootCmd.PersistentFlags().StringVarP(&coreCfgPath, "sys-core-config-path", "c", defaultSysCoreConfigPath, "sys-core config path to use")
	rootCmd.PersistentFlags().StringVarP(&accountCfgPath, "sys-account-config-path", "a", defaultSysAccountConfigPath, "sys-account config path to use")
	rootCmd.PersistentFlags().StringVarP(&discoCfgPath, "mod-disco-config-path", "i", defaultDiscoConfigPath, "mod-disco config path to use")
	rootCmd.PersistentFlags().StringVarP(&fileCfgPath, "sys-file-config-path", "f", defaultSysFileConfigPath, "sys-account config path to use")
	rootCmd.PersistentFlags().IntVarP(&mainexPort, "port", "p", defaultPort, "grpc port to run")
	rootCmd.PersistentFlags().BoolVarP(&local, "local", "l", defaultLocal, "serve locally")
	rootCmd.PersistentFlags().StringVarP(&staticDir, "directory", "d", defaultStaticDir, "directory to serve flutter build")
	rootCmd.PersistentFlags().StringVarP(&localTlsCertPath, "tls-cert-path", "t", defaultLocalTLSCert, "local TLS Cert path")
	rootCmd.PersistentFlags().StringVarP(&localTlsKeyPath, "tls-key-path", "k", defaultLocalTLSKey, "local TLS Key path")
	rootCmd.PersistentFlags().StringVarP(&localRootCAPath, "ca-root-path", "r", defaultCARootPath, "root CA path")
	rootCmd.PersistentFlags().BoolVar(&tlsEnabled, "tls", defaultTlsEnabled, "enable tls on server (note that it needs the path to certificates as well)")

	// logging
	log := logrus.New()
	log.SetLevel(logrus.DebugLevel)
	logger := log.WithField("maintemplate", "v2")

	rootCmd.RunE = func(cmd *cobra.Command, args []string) error {
		// configs
		sspaths := pkg.NewServiceConfigPaths(coreCfgPath, fileCfgPath, accountCfgPath)
		cbus := corebus.NewCoreBus()
		sscfg, err := pkg.NewSysServiceConfig(logger, nil, sspaths, mainexPort, cbus)
		if err != nil {
			logger.Fatalf(errSourcingConfig, err)
		}
		discocfg, err := discoSvc.NewConfig(discoCfgPath)
		if err != nil {
			logger.Fatalf(errSourcingConfig, err)
		}
		discodb, err := coredb.NewCoreDB(logger, &discocfg.ModDiscoConfig.SysCoreConfig, nil)
		if err != nil {
			logger.Fatalf("error creating mod-disco database: %v", err)
		}

		var clientConn *grpc.ClientConn
		var dialOpts grpc.DialOption
		ctx, cancel := context.WithTimeout(context.Background(), defaultTimeout)
		defer cancel()

		if tlsEnabled {
			creds, err := sharedConfig.ClientLoadCA(localRootCAPath)
			if err != nil {
				logger.Fatalf("unable to load CA Root path: %v", err)
			}
			dialOpts = grpc.WithTransportCredentials(creds)

		} else {
			dialOpts = grpc.WithInsecure()
		}
		clientConn, err = grpc.DialContext(ctx, fmt.Sprintf("127.0.0.1:%d", mainexPort),
			dialOpts)
		if err != nil {
			logger.Fatalf("unable to create new client conn: %v", err)
		}
		discoSvcCfg, err := discoPkg.NewModDiscoServiceConfig(logger, discodb, discoCfgPath, cbus, clientConn)
		if err != nil {
			logger.Fatalf("error creating mod-disco: %v", err)
		}
		modDiscoSvc, err := discoPkg.NewModDiscoService(discoSvcCfg)
		if err != nil {
			logger.Fatalf("error creating mod-disco service: %v", err)
		}

		// initiate all sys-* service
		sysSvc, err := pkg.NewService(sscfg)
		if err != nil {
			logger.Fatalf(errCreateSysService, err)
		}

		// initiate grpc server
		var grpcServer *grpc.Server
		unaryInterceptors, streamInterceptors := sysSvc.InjectInterceptors(nil, nil)
		if tlsEnabled {
			logger.Info("Running server with tls enabled")
			tlsCreds, err := sharedConfig.LoadTLSKeypair(localTlsCertPath, localTlsKeyPath)
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
		sysSvc.RegisterServices(grpcServer)
		modDiscoSvc.RegisterServices(grpcServer)
		grpcWebServer := sysSvc.RegisterGrpcWebServer(grpcServer)
		if local && tlsEnabled {
			fileServer := http.FileServer(http.Dir(staticDir))
			httpServer := &http.Server{
				Handler: h2c.NewHandler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
					w.Header().Set("Access-Control-Allow-Origin", "*")
					w.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
					w.Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, X-User-Agent, X-Grpc-Web")
					logger.Infof("Request Endpoint: %s", r.URL)
					if strings.Contains(r.URL.Path, "v2") {
						grpcWebServer.ServeHTTP(w, r)
					} else {
						fileServer.ServeHTTP(w, r)
					}
				}), &http2.Server{}),
			}
			return sysSvc.Run(grpcWebServer, httpServer, localTlsCertPath, localTlsKeyPath)
		}
		return sysSvc.Run(grpcWebServer, nil, "", "")
	}
	if err := rootCmd.Execute(); err != nil {
		logger.Fatalf("error running sys-main: %v", err)
	}
}
