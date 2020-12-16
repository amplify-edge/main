# jsonnet-bundler (jb)
# 

include=./dwn.mk

### BIN
JSONNETB_BIN=$(PWD)/jsonnetb
#https://github.com/jsonnet-bundler/jsonnet-bundler/releases/tag/v0.4.0
# WINDOWS: see: https://github.com/jsonnet-bundler/jsonnet-bundler/issues/134
# DARWIN: https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v0.4.0/jb-darwin-amd64
# LINUX: https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v0.4.0/jb-linux-amd64
JSONNETB_BIN_VERSION=0.4.0
JSONNETB_BIN_PLATFORM=??
# switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
ifeq ($(OS_detected),Windows)
    JSONNETB_BIN_PLATFORM=NOTAVILABLE
endif
ifeq ($(OS_detected),Darwin)
    JSONNETB_BIN_PLATFORM=darwin-amd64
endif
ifeq ($(OS_detected),Linux)
    JSONNETB_BIN_PLATFORM=linux-amd64
endif
JSONNETB_BIN_FILE=jb-$(JSONNETB_BIN_PLATFORM)
JSONNETB_BIN_URL=https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v$(JSONNETB_BIN_VERSION)/$(JSONNETB_BIN_FILE)


jsonnetb-print:
	@echo '-- jsonnet-bundler (jsonnetb) Dep --'
	@echo
	$(MAKE) DWN_URL=$(JSONNETB_BIN_URL) DWN_FILENAME=$(JSONNETB_BIN_FILE) DWN_BIN_FSPATH=$(JSONNETB_BIN) dwn-print
	@echo
	
jsonnetb-dep: jsonnetb-dep-delete
	$(MAKE) DWN_URL=$(JSONNETB_BIN_URL) DWN_FILENAME=$(JSONNETB_BIN_FILE) DWN_BIN_FSPATH=$(JSONNETB_BIN) dwn-download
jsonnetb-dep-delete:
	$(MAKE) DWN_URL=$(JSONNETB_BIN_URL) DWN_FILENAME=$(JSONNETB_BIN_FILE) DWN_BIN_FSPATH=$(JSONNETB_BIN) dwn-delete



	