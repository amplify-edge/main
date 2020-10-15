module github.com/getcouragenow/main

go 1.15

require (
	github.com/getcouragenow/mod v0.0.0-20201015083218-653b7e6af669
	github.com/getcouragenow/sys v0.0.0-20201014041713-18703ae151c6
	github.com/getcouragenow/sys-share v0.0.0-20201014211021-96b3c3299502
	github.com/grpc-ecosystem/go-grpc-middleware v1.2.2
	github.com/sirupsen/logrus v1.7.0
	github.com/spf13/cobra v1.0.0
	google.golang.org/grpc v1.32.0
)

replace github.com/getcouragenow/sys => ../sys
