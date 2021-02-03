package main

// ============================================================================
// GO
// ============================================================================
// GRPC & Protobuf
//go:generate /usr/bin/env bash -c "echo 'Generating protobuf and grpc services golang'"
//go:generate protoc -I./proto/v2/ -I. --go_out=./service/go/rpc/v2 --go_opt=paths=source_relative --jsonschema_out=messages=[BSRequest]=json_fieldnames:. ./proto/v2/main_bootstrap_models.proto
//go:generate protoc -I./proto/v2/ -I. --go-grpc_out=./service/go/rpc/v2/ --cobra_out=./service/go/rpc/v2 --go-grpc_opt=paths=source_relative --cobra_opt=paths=source_relative ./proto/v2/main_bootstrap_services.proto

// ============================================================================
// Flutter
// ============================================================================
// GRPC & Protobuf
//go:generate /usr/bin/env bash -c "echo 'generating protobuf and grpc services for flutter/dart'"
//go:generate protoc -I./proto/v2/ -I. --dart_out=grpc:./service/flu/lib/rpc/v2/ ./proto/v2/main_bootstrap_models.proto ./proto/v2/main_bootstrap_services.proto
//go:generate protoc -I./proto/v2/ -I. --dart_out=./service/flu/lib/rpc/v2/ ./proto/v2/vendor/github.com/amplify-cms/mod/mod-disco/proto/v2/mod_disco_models.proto ./proto/v2/vendor/github.com/amplify-cms/sys-share/sys-account/proto/v2/sys_account_models.proto
//go:generate protoc -I./proto/v2/ -I. --dart_out=./service/flu/lib/rpc/v2/ google/protobuf/timestamp.proto google/protobuf/empty.proto
