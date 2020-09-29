package main

import (
	"context"
	"google.golang.org/grpc"
	glog "google.golang.org/grpc/grpclog"
	"net"
	"os"
	"os/signal"
	"syscall"
)

const (
	ADDRESS = "127.0.0.1:9076"
)

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
}