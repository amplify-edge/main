# go-jsonnet 

include=./dwn.mk

uname_s = $(shell uname -s)
uname_m = $(shell uname -m)

### go-jsonnet
#https://github.com/google/go-jsonnet/releases/tag/v0.17.0

### BIN
JSONNET_BIN=$(PWD)/jsonnet
# https://github.com/google/go-jsonnet/releases/download/
# WINDOWS: https://github.com/google/go-jsonnet/releases/download/v0.17.0/go-jsonnet_0.17.0_Windows_x86_64.tar.gz
# DARWIN: See: https://github.com/google/go-jsonnet/pull/486
# LINUX: https://github.com/google/go-jsonnet/releases/download/v0.17.0/go-jsonnet_0.17.0_Linux_x86_64.tar.gz
JSONNET_BIN_VERSION=0.17.0
JSONNET_BIN_PLATFORM=??
# switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
ifeq ($(OS_detected),Windows)
    JSONNET_BIN_PLATFORM=Windows_x86_64.tar.gz
endif
ifeq ($(OS_detected),Darwin)
    JSONNET_BIN_PLATFORM=NOTAVILABLE # TEMP because no Darwin release has happened
endif
ifeq ($(OS_detected),Linux)
    JSONNET_BIN_PLATFORM=Linux_x86_64.tar.gz
endif
JSONNET_BIN_FILE=go-jsonnet_$(JSONNET_BIN_VERSION)_$(JSONNET_BIN_PLATFORM)
JSONNET_BIN_URL=https://github.com/google/go-jsonnet/releases/download/v$(JSONNET_BIN_VERSION)/$(JSONNET_BIN_FILE)


jsonnet-print:
	@echo -- GORELEASE Dep --
	@echo JSONNET_BIN_VERSION: 	$(JSONNET_BIN_VERSION)
	@echo JSONNET_BIN_URL: 		$(JSONNET_BIN_URL)
	@echo JSONNET_BIN_URLFILE: 	$(JSONNET_BIN_FILE)
	@echo JSONNET_BIN: 			$(JSONNET_BIN)
	@echo
	
jsonnet-dep: jsonnet-dep-delete
	$(MAKE) DWN_URL=$(JSONNET_BIN_URL) DWN_FILENAME=$(JSONNET_BIN_FILE) DWN_BIN_FSPATH=$(JSONNET_BIN) dwn-download 

	@echo work around for darwin

ifeq ($(OS_detected),Darwin)
	brew install go-jsonnet
endif

#	if [$(uname_s)=Darwin]; then \
#		brew install jb \
#		brew install go-jsonnet; \
#	fi
	

jsonnet-dep-delete:
	$(MAKE) DWN_URL=$(JSONNET_BIN_URL) DWN_FILENAME=$(JSONNET_BIN_FILE) DWN_BIN_FSPATH=$(JSONNET_BIN) dwn-delete 



	