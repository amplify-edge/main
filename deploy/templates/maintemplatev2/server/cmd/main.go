package main

import (
	"flag"
	"fmt"
	grpcMw "github.com/grpc-ecosystem/go-grpc-middleware"
	"github.com/sirupsen/logrus"
	"google.golang.org/grpc"
	"log"
	"net"
	"net/http"
	"strings"

	"github.com/getcouragenow/sys/main/pkg"
	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
)

var (
	defaultUnauthenticatedRoutes = []string{
		"/v2.services.AuthService/Login",
		"/v2.services.AuthService/Register",
		"/v2.services.AuthService/ResetPassword",
		"/v2.services.AuthService/ForgotPassword",
		"/v2.services.AuthService/RefreshAccessToken",
		"/grpc.reflection.v1alpha.ServerReflection/ServerReflectionInfo",
	}
)

const (
	errSourcingConfig   = "error while sourcing config: %v"
	errCreateSysService = "error while creating service: %v"
)

type FileSystem struct {
	fs http.FileSystem
}

// Open opens file
func (fs FileSystem) Open(path string) (http.File, error) {
	f, err := fs.fs.Open(path)
	if err != nil {
		return nil, err
	}

	s, err := f.Stat()
	if s.IsDir() {
		index := strings.TrimSuffix(path, "/") + "/index.html"
		if _, err := fs.fs.Open(index); err != nil {
			return nil, err
		}
	}

	return f, nil
}

var port = flag.Int("port", 9074, "the port to serve on")
var local = flag.Bool("local", false, "flag for local development")
var directory = flag.String("dir", "../client/build/web/", "the directory of static file to host")

func main() {
	flag.Parse()

	logrusLevel := logrus.InfoLevel
	if *local {
		logrusLevel = logrus.DebugLevel
	}
	l := logrus.New()
	l.SetLevel(logrusLevel)
	logger := l.WithField("maintemplate", "v2")

	// Create / source config
	sscfg, err := pkg.NewSysServiceConfig(logger, nil, defaultUnauthenticatedRoutes, *port)
	if err != nil {
		logger.Fatalf(errSourcingConfig, err)
	}
	sysService, err := pkg.NewService(sscfg)
	if err != nil {
		logger.Fatalf(errCreateSysService, err)
	}

	unaryInterceptors, streamInterceptors := sysService.InjectInterceptors(nil, nil)
	grpcServer := grpc.NewServer(
		grpcMw.WithUnaryServerChain(unaryInterceptors...),
		grpcMw.WithStreamServerChain(streamInterceptors...),
	)
	sysService.RegisterServices(grpcServer)

	if *local {
		fileServer := http.FileServer(FileSystem{http.Dir(*directory)})

		grpcWebServer := sysService.RegisterGrpcWebServer(grpcServer)

		httpServer := &http.Server{
			Handler: h2c.NewHandler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
				w.Header().Set("Access-Control-Allow-Origin", "*")
				w.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
				w.Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, X-User-Agent, X-Grpc-Web")
				logger.Infof("Request Endpoint: %s", r.URL)
				if strings.Contains(r.URL.Path, "v2.services") {
					grpcWebServer.ServeHTTP(w, r)
				} else {
					fileServer.ServeHTTP(w, r)
				}
			}), &http2.Server{}),
		}

		sysService.Run(grpcWebServer, httpServer)

	} else {
		lis, err := net.Listen("tcp", fmt.Sprintf(":%d", *port))
		if err != nil {
			log.Fatalf("failed to listen: %v", err)
		}
		fmt.Printf("server listening at %v\n", lis.Addr())

		if err := grpcServer.Serve(lis); err != nil {
			log.Fatalf("failed to serve: %v", err)
		}
	}

}
