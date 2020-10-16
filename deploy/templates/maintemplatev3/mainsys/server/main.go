package main

import (
	grpcMw "github.com/grpc-ecosystem/go-grpc-middleware"
	"github.com/sirupsen/logrus"
	"google.golang.org/grpc"

	corepkg "github.com/getcouragenow/sys/main/pkg"
	corecfg "github.com/getcouragenow/sys/sys-core/service/go"
	coredb "github.com/getcouragenow/sys/sys-core/service/go/pkg/db"
)

var (
	defaultUnauthenticatedRoutes = []string{
		"/v2.services.AuthService/Login",
		"/v2.services.AuthService/Register",
		"/v2.services.AuthService/ResetPassword",
		"/v2.services.AuthService/ForgotPassword",
		"/v2.services.AuthService/RefreshAccessToken",
		"/v2.services.AccountService/GetAccount",
		"/grpc.reflection.v1alpha.ServerReflection/ServerReflectionInfo",
	}

	defaultDbName          = "getcouragenow.db"
	defaultDbEncryptionKey = "testkey@!" // for test only.
	// TODO: Make config
	defaultDbDir               = "./db"
	defaultDbBackupDir         = "./db/backups"
	defaultDbBackupSchedulSpec = "@every 15s"
	defaultDbRotateSchedulSpec = "@every 1h"
	defaultSecret              = "XXD54YBnPiSrIW4i6jyxzLybVFXTp0wD\n"
)

const (
	// TODO: Make config
	defaultPort          = 9075
	errSourcingConfig    = "error while sourcing config: %v"
	errCreateSysService  = "error while creating sys-* service: %v"
	errInitDatabase      = "db initialization failed: %v"
	errGetSharedDatabase = "failed to get shared database: %v"
)

func main() {
	logger := logrus.New().WithField("sysmain", "v3")

	csc := &corecfg.SysCoreConfig{
		DbConfig: corecfg.DbConfig{
			Name:             defaultDbName,
			EncryptKey:       defaultDbEncryptionKey,
			RotationDuration: 1,
			DbDir:            defaultDbDir,
		},
		CronConfig: corecfg.CronConfig{
			BackupSchedule: defaultDbBackupSchedulSpec,
			RotateSchedule: defaultDbRotateSchedulSpec,
			BackupDir:      defaultDbBackupDir,
		},
	}

	if err := coredb.InitDatabase(csc); err != nil {
		logger.Fatalf(errInitDatabase, err)
	}

	gdb, err := coredb.SharedDatabase()
	if err != nil {
		logger.Fatalf(errGetSharedDatabase, err)
	}

	sscfg, err := corepkg.NewSysServiceConfig(logger, gdb, defaultUnauthenticatedRoutes, defaultPort)
	if err != nil {
		logger.Fatalf(errSourcingConfig, err)
	}
	sscfg.SysAccount.Cfg.JWTConfig.Access.Secret = defaultSecret
	sscfg.SysAccount.Cfg.JWTConfig.Refresh.Secret = defaultSecret
	sysSvc, err := corepkg.NewService(sscfg)
	if err != nil {
		logger.Fatalf(errCreateSysService, err)
	}
	unaryInterceptors, streamInterceptors := sysSvc.InjectInterceptors(nil, nil)
	grpcServer := grpc.NewServer(
		grpcMw.WithUnaryServerChain(unaryInterceptors...),
		grpcMw.WithStreamServerChain(streamInterceptors...),
	)
	sysSvc.RegisterServices(grpcServer)
	grpcWebServer := sysSvc.RegisterGrpcWebServer(grpcServer)
	sysSvc.Run(grpcWebServer, nil)
}
