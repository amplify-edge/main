// This is not really clean but anyway, just to keep it going
package main

import (
	"context"
	"flag"
	"fmt"
	grpcMw "github.com/grpc-ecosystem/go-grpc-middleware"
	grpcLogrus "github.com/grpc-ecosystem/go-grpc-middleware/logging/logrus"
	grpcRecovery "github.com/grpc-ecosystem/go-grpc-middleware/recovery"

	"time"

	"github.com/sirupsen/logrus"
	"google.golang.org/grpc"

	modpkg "github.com/getcouragenow/mod/main/pkg"
	accountConfig "github.com/getcouragenow/sys/sys-account/service/go"
	accountRepo "github.com/getcouragenow/sys/sys-account/service/go/pkg/repo"
	corecfg "github.com/getcouragenow/sys/sys-core/service/go"
	coredb "github.com/getcouragenow/sys/sys-core/service/go/pkg/db"
)

// TODO @gutterbacon: Every kind of configs are hardcoded for now.
const (
	// TODO @gutterbacon: JSONNET config
	defaultPort                = 9074
	defaultSysPort             = 9075
	defaultTimeout             = 5 * time.Second
	defaultSysHost             = "127.0.0.1"
	defaultDbName              = "getcouragenow.db"
	defaultDbEncryptionKey     = "testkey@!" // for test only.
	defaultDbDir               = "./db"
	defaultDbBackupDir         = "./db/backups"
	defaultDbBackupSchedulSpec = "@every 15s"
	defaultDbRotateSchedulSpec = "@every 1h"
	defaultSecret              = "XXD54YBnPiSrIW4i6jyxzLybVFXTp0wD\n"

	errSourcingConfig    = "error while sourcing config: %v"
	errConnectingMainSys = "error while trying to connect to mainsys: %v"
	errCreateSysService  = "error while creating modmainv3 service: %v"
	errCreatingDB        = "error while initiating db: %v"
	errGetSharedDB       = "error getting shared database: %v"
)

var (
	port    = flag.Int("port", defaultPort, "the port to serve on")
	sysPort = flag.Int("sysport", defaultSysPort, "the mainsys port to connect to")
	sysHost = flag.String("syshost", defaultSysHost, "the IP address mainsys is running at")

	defaultUnauthenticatedRoutes = []string{
		"/v2.mod_services.DummyService/ListAccounts",
		"/grpc.reflection.v1alpha.ServerReflection/ServerReflectionInfo",
	}
)

func recoveryHandler(l *logrus.Entry) func(panic interface{}) error {
	return func(panic interface{}) error {
		l.Warnf("sys-account service recovered, reason: %v",
			panic)
		return nil
	}
}

func main() {
	flag.Parse()
	l := logrus.New().WithField("svc", "mainmodv3")
	ctx, cancel := context.WithTimeout(context.Background(), defaultTimeout)
	defer cancel()

	dialConn, err := grpc.DialContext(ctx, fmt.Sprintf("%s:%d", *sysHost, *sysPort), grpc.WithInsecure())
	if err != nil {
		l.Fatalf(errConnectingMainSys, err)
	}

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
		l.Fatalf(errCreatingDB, err)
	}

	gdb, err := coredb.SharedDatabase()
	if err != nil {
		l.Fatalf(errGetSharedDB, err)
	}
	accountCfg := accountConfig.SysAccountConfig{
		UnauthenticatedRoutes: defaultUnauthenticatedRoutes,
		JWTConfig: accountConfig.JWTConfig{
			Access: accountConfig.TokenConfig{
				Secret: defaultSecret,
			},
			Refresh: accountConfig.TokenConfig{
				Secret: defaultSecret,
			},
		},
	}
	sysAccRepo, err := accountRepo.NewAuthRepo(l, gdb, &accountCfg)
	if err != nil {
		l.Fatalf(errCreateSysService, err)
	}
	modsvc, err := modpkg.NewModService(l, *port, nil, nil, dialConn, sysAccRepo.DefaultInterceptor)
	if err != nil {
		l.Fatalf(errCreateSysService, err)
	}

	unaryItc, streamItc := modsvc.InjectInterceptors(nil, nil)
	recoveryOptions := []grpcRecovery.Option{
		grpcRecovery.WithRecoveryHandler(recoveryHandler(l)),
	}
	logrusOpts := []grpcLogrus.Option{
		grpcLogrus.WithLevels(grpcLogrus.DefaultCodeToLevel),
	}
	unaryItc = append(unaryItc, grpcRecovery.UnaryServerInterceptor(recoveryOptions...), grpcLogrus.UnaryServerInterceptor(l, logrusOpts...))
	streamItc = append(streamItc, grpcRecovery.StreamServerInterceptor(recoveryOptions...), grpcLogrus.StreamServerInterceptor(l, logrusOpts...))

	// grpc
	grpcServer := grpc.NewServer(
		grpcMw.WithUnaryServerChain(unaryItc...),
		grpcMw.WithStreamServerChain(streamItc...),
	)
	// register service
	modsvc.RegisterServices(grpcServer)
	grpcWebServer := modsvc.RegisterGrpcWebServer(grpcServer)
	modsvc.Run(grpcWebServer, nil)
}
