SAMPLE_FSPATH = $(PWD)
LIB_NAME = packer

print:
	@echo SAMPLE_FSPATH: ${SAMPLE_FSPATH}
	@echo GOPATH = ${GOPATH}

# packer
# 1. go-build => build go binary
# 2. go-pack-deb => pack an app to debian package
# 2. go-pack-win => pack an app to msi package
go-build:
	cd ${SAMPLE_FSPATH} && go build -o ${LIB_NAME} .

go-pack-deb:
	go run main.go -pack=deb -config=config/deb.json -version=2.0

go-build-dep:
	# sudo apt install wixl
	sudo apt-get update
	sudo apt-get install wixl

go-pack-win:
	go run main.go -pack=win -config=config/win.json -version=2.0