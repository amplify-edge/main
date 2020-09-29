package main

import (
	"flag"
	"fmt"
	"log"
	"net"
	"net/http"
	"strings"

	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
	"google.golang.org/grpc"

	"github.com/improbable-eng/grpc-web/go/grpcweb"

	"github.com/nats-io/nats.go"
	stan "github.com/nats-io/stan.go"

	modchat_pb "github.com/getcouragenow/packages/mod-chat/server/pkg/api"
	modchat_srv "github.com/getcouragenow/packages/mod-chat/server/pkg/service"
	// auth "github.com/envoyproxy/go-control-plane/envoy/service/auth/v2"
	// authz "github.com/getcouragenow/packages/mod-account/server/authz_server"
	// healthpb "google.golang.org/grpc/health/grpc_health_v1"
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
var natsAddr = flag.String("nats-server", "127.0.0.1", "nats server address")

func main() {
	flag.Parse()

	nc, err := nats.Connect(fmt.Sprintf("nats://%s:4222", *natsAddr))
	if err != nil {
		log.Fatal(err)
	}
	defer nc.Close()

	conn, err := stan.Connect("test-cluster", "test-client", stan.NatsConn(nc))
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close()

	// opts := []grpc.ServerOption{grpc.MaxConcurrentStreams(10)}
	// opts = append(opts)

	grpcServer := grpc.NewServer()

	server := &modchat_srv.Server{conn}

	// chat server
	modchat_pb.RegisterBroadcastServer(grpcServer, server)

	// authz server
	// auth.RegisterAuthorizationServer(grpcServer, &authz.AuthorizationServer{})

	// health check server
	// healthpb.RegisterHealthServer(grpcServer, &authz.HealthServer{})

	if *local {
		fileServer := http.FileServer(FileSystem{http.Dir(*directory)})

		grpcWebServer := grpcweb.WrapServer(grpcServer)

		httpServer := &http.Server{
			Handler: h2c.NewHandler(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
				if r.ProtoMajor == 2 {
					grpcWebServer.ServeHTTP(w, r)
				} else {
					w.Header().Set("Access-Control-Allow-Origin", "*")
					w.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
					w.Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, X-User-Agent, X-Grpc-Web")
					w.Header().Set("grpc-status", "")
					w.Header().Set("grpc-message", "")
					if grpcWebServer.IsGrpcWebRequest(r) {
						grpcWebServer.ServeHTTP(w, r)
						fmt.Println("GRPC Request", r.URL)
					} else {
						fileServer.ServeHTTP(w, r)
					}
				}
			}), &http2.Server{}),
		}

		httpServer.Addr = fmt.Sprintf(":%d", *port)

		err := httpServer.ListenAndServe()
		if err != nil {
			log.Fatal(err)
		}

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
