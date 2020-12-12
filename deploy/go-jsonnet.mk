# jsonnet-bundler, go-jsonnet 
# 

include=./dwn.mk


### go-jsonnet
#https://github.com/google/go-jsonnet/releases/tag/v0.17.0

### BIN
JSONNET_BIN=$(PWD)/goreleaser
# https://github.com/goreleaser/goreleaser/releases/tag/v0.149.0
# https://github.com/goreleaser/goreleaser/releases/download/v0.149.0/goreleaser_Windows_x86_64.zip
# https://github.com/goreleaser/goreleaser/releases/download/v0.149.0/goreleaser_Darwin_x86_64.tar.gz
# https://github.com/goreleaser/goreleaser/releases/download/v0.149.0/goreleaser_Linux_arm64.tar.gz
JSONNET_BIN_VERSION=0.149.0
JSONNET_BIN_PLATFORM=??
# switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
ifeq ($(OS_detected),Windows)
    JSONNET_BIN_PLATFORM=Windows_x86_64.zip
endif
ifeq ($(OS_detected),Darwin)
    JSONNET_BIN_PLATFORM=Darwin_x86_64.tar.gz
endif
ifeq ($(OS_detected),Linux)
    JSONNET_BIN_PLATFORM=Linux_arm64.tar.gz
endif
JSONNET_BIN_FILE=goreleaser_$(JSONNET_BIN_PLATFORM)
JSONNET_BIN_URL=https://github.com/goreleaser/goreleaser/releases/download/v$(JSONNET_BIN_VERSION)/$(JSONNET_BIN_FILE)


gor-print:
	@echo -- GORELEASE Dep --
	@echo JSONNET_BIN_VERSION: 	$(JSONNET_BIN_VERSION)
	@echo JSONNET_BIN_URL: 		$(JSONNET_BIN_URL)
	@echo JSONNET_BIN_URLFILE: 	$(JSONNET_BIN_FILE)
	@echo JSONNET_BIN: 			$(JSONNET_BIN)
	@echo
	
gor-dep: gor-dep-delete
	$(MAKE) DWN_URL=$(JSONNET_BIN_URL) DWN_FILENAME=$(JSONNET_BIN_FILE) DWN_BIN_FSPATH=$(JSONNET_BIN) dwn-download 
gor-dep-delete:
	$(MAKE) DWN_URL=$(JSONNET_BIN_URL) DWN_FILENAME=$(JSONNET_BIN_FILE) DWN_BIN_FSPATH=$(JSONNET_BIN) dwn-delete 



	