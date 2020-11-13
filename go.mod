module github.com/getcouragenow/main

go 1.15

require (
	github.com/getcouragenow/mod v0.0.0-20201102154256-76639b41d618
	github.com/getcouragenow/protoc-gen-cobra v0.3.1-0.20201005114840-ccc8cd57bcdc
	github.com/getcouragenow/sys v0.0.0-20201102153848-4460bc43174f
	github.com/getcouragenow/sys-share v0.0.0-20201102093809-ef0efd93ad36
	github.com/golang/protobuf v1.4.3
	github.com/grpc-ecosystem/go-grpc-middleware v1.2.2
	github.com/sirupsen/logrus v1.7.0
	github.com/spf13/cobra v1.0.0
	github.com/stretchr/testify v1.6.1
	golang.org/x/net v0.0.0-20201029221708-28c70e62bb1d
	google.golang.org/grpc v1.32.0
	google.golang.org/protobuf v1.25.0
	gopkg.in/yaml.v2 v2.3.0
)

replace github.com/getcouragenow/sys-share => ../sys-share/

replace github.com/getcouragenow/sys => ../sys

replace github.com/getcouragenow/mod => ../mod
