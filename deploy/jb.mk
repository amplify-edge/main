# jsonnet-bundler (jb)
# 

include=./dwn.mk

### BIN
JB_BIN=$(PWD)/goreleaser
#https://github.com/jsonnet-bundler/jsonnet-bundler/releases/tag/v0.4.0
# NO WINDOWS sorry :)
# https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v0.4.0/jb-darwin-amd64
# https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v0.4.0/jb-linux-amd64
JB_BIN_VERSION=0.4.0
JB_BIN_PLATFORM=??
# switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
ifeq ($(OS_detected),Windows)
    JB_BIN_PLATFORM=NULL
endif
ifeq ($(OS_detected),Darwin)
    JB_BIN_PLATFORM=darwin-amd64
endif
ifeq ($(OS_detected),Linux)
    JB_BIN_PLATFORM=linux-amd64
endif
JB_BIN_FILE=jb-$(JB_BIN_PLATFORM)
JB_BIN_URL=https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v$(JB_BIN_VERSION)/$(JB_BIN_FILE)


jb-print:
	@echo -- jsonnet-bundler (jb) Dep --
	@echo
	$(MAKE) DWN_URL=$(JB_BIN_URL) DWN_FILENAME=$(JB_BIN_FILE) DWN_BIN_FSPATH=$(JB_BIN) dwn-print 
	@echo
	
jb-dep: jb-dep-delete
	$(MAKE) DWN_URL=$(JB_BIN_URL) DWN_FILENAME=$(JB_BIN_FILE) DWN_BIN_FSPATH=$(JB_BIN) dwn-download 
jb-dep-delete:
	$(MAKE) DWN_URL=$(JB_BIN_URL) DWN_FILENAME=$(JB_BIN_FILE) DWN_BIN_FSPATH=$(JB_BIN) dwn-delete 



	