package main

import (
	"github.com/getcouragenow/main/mod/mod-account/server/authz/pkg/filters"
	"log"
	"net"
	"os"
	"os/signal"
	"strings"
	"syscall"

	"golang.org/x/net/context"
	"google.golang.org/grpc"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/health"
	healthpb "google.golang.org/grpc/health/grpc_health_v1"
	"google.golang.org/grpc/status"

	envoy_auth "github.com/envoyproxy/go-control-plane/envoy/service/auth/v2"
	glog "google.golang.org/grpc/grpclog"
)

var (
	conn *grpc.ClientConn
	hs   *health.Server
)

const (
	// hardcoded as of now , following envoy's config in the maintemplate (envoy-configmap-authz.yaml.tmp)
	ADDRESS     string = ":9075"
	AUTH_HEADER string = "Authorization"
)

type healthServer struct{}

func (s *healthServer) Check(ctx context.Context, in *healthpb.HealthCheckRequest) (*healthpb.HealthCheckResponse, error) {
	log.Printf("Handling grpc Check request")
	return &healthpb.HealthCheckResponse{Status: healthpb.HealthCheckResponse_SERVING}, nil
}

func (s *healthServer) Watch(in *healthpb.HealthCheckRequest, srv healthpb.Health_WatchServer) error {
	return status.Error(codes.Unimplemented, "Watch is not implemented")
}

type AuthorizationServer struct{}

func (a *AuthorizationServer) Check(ctx context.Context, req *envoy_auth.CheckRequest) (*envoy_auth.CheckResponse, error) {
	authHeader, ok := req.Attributes.Request.Http.Headers[AUTH_HEADER]
	var splitToken []string

	if ok {
		splitToken = strings.Split(authHeader, "Bearer ")
	}
	if len(splitToken) == 2 {
		token := splitToken[1]
		if ok, err := filters.FilterJWT(token); !ok {
			return guestResponse(), nil
		} else if err != nil {
			return guestResponse(), nil
		}
		uid, err := filters.GetClaim(token)
		if err != nil {
			return guestResponse(), nil
		}
		res := filters.OKResponse(filters.GenAuthdUser(*uid, token))
		return res, nil
	}
	return guestResponse(), nil
}

func guestResponse() *envoy_auth.CheckResponse {
	return filters.OKResponse(filters.GenGuestUser())
}

func main() {
	logger := glog.NewLoggerV2(os.Stdout, os.Stdout, os.Stdout)
	ctx := context.Background()
	ctx, cancel := context.WithCancel(ctx)
	defer cancel()

	// graceful shutdown as always
	interrupt := make(chan os.Signal, 1)
	signal.Notify(interrupt, os.Interrupt, syscall.SIGTERM)
	defer signal.Stop(interrupt)

	lis, err := net.Listen("tcp", ADDRESS)
	if err != nil {
		logger.Fatalf("failed to listen: %v", err)
	}

	opts := []grpc.ServerOption{grpc.MaxConcurrentStreams(10)}
	opts = append(opts)

	s := grpc.NewServer(opts...)

	envoy_auth.RegisterAuthorizationServer(s, &AuthorizationServer{})
	healthpb.RegisterHealthServer(s, &healthServer{})

	logger.Infof("Starting gRPC Server at %s", ADDRESS)
	go s.Serve(lis)

	select {
	case <-ctx.Done():
		break
	case <-interrupt:
		break
	}
	cancel()
	logger.Warningln("Received termination signal")

	s.GracefulStop()

}
