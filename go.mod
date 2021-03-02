module go.amplifyedge.org/main-v2

go 1.16

require (
	github.com/NYTimes/gziphandler v1.1.1
	github.com/VictoriaMetrics/metrics v1.13.0
	github.com/golang/protobuf v1.4.3
	github.com/grpc-ecosystem/go-grpc-middleware v1.2.2
	github.com/improbable-eng/grpc-web v0.14.0
	github.com/opentracing/opentracing-go v1.2.0
	github.com/spf13/cobra v1.1.1
	github.com/stretchr/testify v1.7.0
	github.com/winwisely268/go-grpc-victoriametrics v0.0.0-20210117131506-2598babca58f
	go.amplifyedge.org/mod-v2 v0.0.0-00010101000000-000000000000
	go.amplifyedge.org/protoc-gen-cobra v0.4.0
	go.amplifyedge.org/shared-v2 v0.0.0-20210206033451-c2ed0874320f
	go.amplifyedge.org/sys-share-v2 v0.0.0-00010101000000-000000000000
	go.amplifyedge.org/sys-v2 v0.0.0-00010101000000-000000000000
	golang.org/x/net v0.0.0-20210119194325-5f4716e94777
	golang.org/x/sys v0.0.0-20210113181707-4bcb84eeeb78 // indirect
	golang.org/x/text v0.3.5 // indirect
	google.golang.org/genproto v0.0.0-20210114201628-6edceaf6022f // indirect
	google.golang.org/grpc v1.35.0
	google.golang.org/protobuf v1.25.0
	gopkg.in/yaml.v2 v2.4.0
)

replace go.amplifyedge.org/sys-share-v2 => ../sys-share/

replace go.amplifyedge.org/sys-v2 => ../sys

replace go.amplifyedge.org/mod-v2 => ../mod
