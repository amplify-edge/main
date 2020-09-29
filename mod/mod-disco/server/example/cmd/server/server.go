package main

import (
	"context"
	"flag"
	"log"
	"net"
	"os"
	"os/signal"
	"syscall"

	api "github.com/getcouragenow/modules/mod-disco/server/pkg/api"
	"github.com/getcouragenow/modules/mod-disco/server/pkg/service"
	"github.com/joho/godotenv"
	"google.golang.org/grpc"
	glog "google.golang.org/grpc/grpclog"
)

var (
	envFile = flag.String("c", "./env.sample", "path to config file")
)

/*

boot grpc
boot http server for flutter
load its assets
load its sub assets

*/

// TODO need environment vars
func main() {
	flag.Parse()
	err := godotenv.Load(*envFile)
	if err != nil {
		log.Fatalf("Couldn't open config file: %v", err)
	}
	logger := glog.NewLoggerV2(os.Stdout, os.Stdout, os.Stdout)
	ctx := context.Background()
	ctx, cancel := context.WithCancel(ctx)
	defer cancel()

	// graceful shutdown
	interrupt := make(chan os.Signal, 1)
	signal.Notify(interrupt, os.Interrupt, syscall.SIGTERM)
	defer signal.Stop(interrupt)

	srv, err := service.New(ctx, logger)
	if err != nil {
		logger.Fatal("Error when creating mod-main server: %s", err.Error())
	}

	grpcServer := grpc.NewServer()
	lis, err := net.Listen("tcp", ":8081")
	if err != nil {
		logger.Fatalf("Error when creating server: %v", err)
	}

	logger.Infoln("Server runing on 127.0.0.1:8081")
	api.RegisterQuestionServer(grpcServer, srv)
	go grpcServer.Serve(lis)

	select {
	case <-ctx.Done():
		break
	case <-interrupt:
		break
	}

	cancel()
	logger.Warningln("Receive termination signal")

	grpcServer.GracefulStop()
}
