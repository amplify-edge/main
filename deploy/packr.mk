# jsonnet-bundler (jb)
# 

include=./dwn.mk

### BIN
PACKR-BIN=$(PWD)/jsonnetb
#https://github.com/gobuffalo/packr/releases/tag/v2.8.1
# WINDOWS: see: https://github.com/jsonnet-bundler/jsonnet-bundler/issues/134
# DARWIN: https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v0.4.0/jb-darwin-amd64
# LINUX: https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v0.4.0/jb-linux-amd64
PACKR-BIN_VERSION=0.4.0
PACKR-BIN_PLATFORM=??
# switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
ifeq ($(OS_detected),Windows)
    PACKR-BIN_PLATFORM=NOTAVILABLE
endif
ifeq ($(OS_detected),Darwin)
    PACKR-BIN_PLATFORM=darwin-amd64
endif
ifeq ($(OS_detected),Linux)
    PACKR-BIN_PLATFORM=linux-amd64
endif
PACKR-BIN_FILE=jb-$(PACKR-BIN_PLATFORM)
PACKR-BIN_URL=https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v$(PACKR-BIN_VERSION)/$(PACKR-BIN_FILE)


packr-print:
	@echo '-- jsonnet-bundler (jsonnetb) Dep --'
	@echo
	$(MAKE) DWN_URL=$(PACKR-BIN_URL) DWN_FILENAME=$(PACKR-BIN_FILE) DWN_BIN_FSPATH=$(PACKR-BIN) dwn-print
	@echo
	
packr-dep: packr-dep-delete
	$(MAKE) DWN_URL=$(PACKR-BIN_URL) DWN_FILENAME=$(PACKR-BIN_FILE) DWN_BIN_FSPATH=$(PACKR-BIN) dwn-download
packr-dep-delete:
	$(MAKE) DWN_URL=$(PACKR-BIN_URL) DWN_FILENAME=$(PACKR-BIN_FILE) DWN_BIN_FSPATH=$(PACKR-BIN) dwn-delete



	