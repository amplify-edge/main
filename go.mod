module github.com/getcouragenow/main

go 1.15

require (
	github.com/NYTimes/gziphandler v1.1.1
	github.com/getcouragenow/mod v0.0.0-20201218035308-a5b49fb1c8c0
	github.com/getcouragenow/ops/bs-crypt v0.0.0-20201217090659-8c6ef1d444c3
	github.com/getcouragenow/protoc-gen-cobra v0.3.1-0.20201005114840-ccc8cd57bcdc
	github.com/getcouragenow/sys v0.0.0-20201218035624-ed792979a4c3
	github.com/getcouragenow/sys-share v0.0.0-20201218044802-0904b5a33d11
	github.com/go-bindata/go-bindata v3.1.2+incompatible // indirect
	github.com/golang/protobuf v1.4.3
	github.com/grpc-ecosystem/go-grpc-middleware v1.2.2
	github.com/improbable-eng/grpc-web v0.13.0
	github.com/sirupsen/logrus v1.7.0
	github.com/spf13/cobra v1.1.1
	github.com/stretchr/testify v1.6.1
	golang.org/x/net v0.0.0-20201110031124-69a78807bb2b
	golang.org/x/sys v0.0.0-20201211090839-8ad439b19e0f // indirect
	google.golang.org/grpc v1.33.2
	google.golang.org/protobuf v1.25.0
	gopkg.in/yaml.v2 v2.3.0
)

//replace github.com/getcouragenow/sys-share => ../sys-share/

//replace github.com/getcouragenow/sys => ../sys

//replace github.com/getcouragenow/mod => ../mod
