module github.com/getcouragenow/main

go 1.15

require (
	github.com/NYTimes/gziphandler v1.1.1
	github.com/fatih/color v1.10.0 // indirect
	github.com/getcouragenow/mod v0.0.0-20201210114124-7544fa4b6846
	github.com/getcouragenow/protoc-gen-cobra v0.3.1-0.20201005114840-ccc8cd57bcdc
	github.com/getcouragenow/sys v0.0.0-20201210114100-bbce22eadce6
	github.com/getcouragenow/sys-share v0.0.0-20201211115435-35b645d047ee
	github.com/go-bindata/go-bindata v3.1.2+incompatible // indirect
	github.com/golang/protobuf v1.4.3
	github.com/google/go-jsonnet v0.17.0 // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.2.2
	github.com/improbable-eng/grpc-web v0.13.0
	github.com/jsonnet-bundler/jsonnet-bundler v0.4.0 // indirect
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
