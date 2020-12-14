# sops (sops)
# 

include=./dwn.mk

### BIN
SOPS_BIN=$(PWD)/goreleaser
# https://github.com/mozilla/sops/releases/tag/v3.6.1
# WINDOWS: https://github.com/mozilla/sops/releases/download/v3.6.1/sops-v3.6.1.exe
# DARWIN: https://github.com/mozilla/sops/releases/download/v3.6.1/sops-v3.6.1.darwin
# LINUX: https://github.com/mozilla/sops/releases/download/v3.6.1/sops-v3.6.1.linux
SOPS_BIN_VERSION=3.6.1
SOPS_BIN_PLATFORM=??
# switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
ifeq ($(OS_detected),Windows)
    SOPS_BIN_PLATFORM=exe
endif
ifeq ($(OS_detected),Darwin)
    SOPS_BIN_PLATFORM=darwin
endif
ifeq ($(OS_detected),Linux)
    SOPS_BIN_PLATFORM=linux
endif
SOPS_BIN_FILE=sops-v$(SOPS_BIN_VERSION)$(SOPS_BIN_PLATFORM)
SOPS_BIN_URL=https://github.com/mozilla/sops/releases/download/v$(SOPS_BIN_VERSION)/$(SOPS_BIN_FILE)


sops-print:
	@echo -- jsonnet-bundler (jb) Dep --
	@echo
	$(MAKE) DWN_URL=$(SOPS_BIN_URL) DWN_FILENAME=$(SOPS_BIN_FILE) DWN_BIN_FSPATH=$(SOPS_BIN) dwn-print 
	@echo
	
sops-dep: sops-dep-delete
	$(MAKE) DWN_URL=$(SOPS_BIN_URL) DWN_FILENAME=$(SOPS_BIN_FILE) DWN_BIN_FSPATH=$(SOPS_BIN) dwn-download 
sops-dep-delete:
	$(MAKE) DWN_URL=$(SOPS_BIN_URL) DWN_FILENAME=$(SOPS_BIN_FILE) DWN_BIN_FSPATH=$(SOPS_BIN) dwn-delete 



	