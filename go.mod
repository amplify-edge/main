module github.com/getcouragenow/main

go 1.15

require (
	github.com/NYTimes/gziphandler v1.1.1
	github.com/VictoriaMetrics/metrics v1.12.3
	github.com/getcouragenow/mod v0.0.0-20201231112419-464a8b299f87
	github.com/getcouragenow/ops/bs-crypt v0.0.0-20201217090659-8c6ef1d444c3
	github.com/getcouragenow/protoc-gen-cobra v0.3.1-0.20201005114840-ccc8cd57bcdc
	github.com/getcouragenow/sys v0.0.0-20201230052306-22a6aaf34655
	github.com/getcouragenow/sys-share v0.0.0-20201231111816-770029a76658
	github.com/golang/protobuf v1.4.3
	github.com/grpc-ecosystem/go-grpc-middleware v1.2.2
	github.com/improbable-eng/grpc-web v0.13.0
	github.com/opentracing/opentracing-go v1.1.0
	github.com/spf13/cobra v1.1.1
	github.com/stretchr/testify v1.6.1
	github.com/winwisely268/go-grpc-victoriametrics v0.0.0-20210117131506-2598babca58f
	golang.org/x/net v0.0.0-20201224014010-6772e930b67b
	golang.org/x/sys v0.0.0-20210113181707-4bcb84eeeb78 // indirect
	golang.org/x/text v0.3.5 // indirect
	google.golang.org/genproto v0.0.0-20210114201628-6edceaf6022f // indirect
	google.golang.org/grpc v1.35.0
	google.golang.org/protobuf v1.25.0
	gopkg.in/yaml.v2 v2.3.0
)

replace github.com/getcouragenow/sys-share => ../sys-share/

replace github.com/getcouragenow/sys => ../sys

replace github.com/getcouragenow/mod => ../mod
