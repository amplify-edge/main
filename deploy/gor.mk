# goreleaser (gor)
# https://github.com/goreleaser/goreleaser/releases

include=./dwn.mk

#uname_s := $(shell uname -s)
#uname_m := $(shell uname -m)

### BIN
PREFIX=/usr/local/bin
GOR_OUTPUT_DIR=downloaded
GOR_BIN=goreleaser
# https://github.com/goreleaser/goreleaser/releases/tag/v0.149.0
# https://github.com/goreleaser/goreleaser/releases/download/v0.149.0/goreleaser_Windows_x86_64.zip
# https://github.com/goreleaser/goreleaser/releases/download/v0.149.0/goreleaser_Darwin_x86_64.tar.gz
# https://github.com/goreleaser/goreleaser/releases/download/v0.149.0/goreleaser_Linux_arm64.tar.gz
GOR_BIN_VERSION=0.149.0
# switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
ifeq ($(OS),Windows)
    GOR_BIN_PLATFORM:=Windows_x86_64.zip
endif
ifeq ($(uname_s),Darwin)
    GOR_BIN_PLATFORM:=Darwin_x86_64.tar.gz
endif
ifeq ($(uname_s),Linux)
    GOR_BIN_PLATFORM:=Linux_x86_64.tar.gz
endif
GOR_BIN_FILE=goreleaser_$(GOR_BIN_PLATFORM)
GOR_BIN_URL=https://github.com/goreleaser/goreleaser/releases/download/v$(GOR_BIN_VERSION)/$(GOR_BIN_FILE)


gor-print:
	@echo -- GORELEASE Dep --
	@echo GOR_BIN_VERSION: 	$(GOR_BIN_VERSION)
	@echo GOR_BIN_URL: 		$(GOR_BIN_URL)
	@echo GOR_BIN_URLFILE: 	$(GOR_BIN_FILE)
	@echo GOR_BIN_PLATFORM: $(GOR_BIN_PLATFORM)
	@echo GOR_BIN: 			$(GOR_BIN)
	@echo
	
gor-dep: gor-dep-delete
	$(MAKE) DWN_URL=$(GOR_BIN_URL) \
		DWN_FILENAME=$(GOR_BIN_FILE) \
 		DWN_BIN_NAME=$(GOR_BIN) \
 		DWN_BIN_OUTPUT_DIR=$(GOR_OUTPUT_DIR) dwn-download
	if [[ $(uname_s) = Darwin || $(uname_s) = Linux ]]; then \
  		sudo install -m755 $(GOR_OUTPUT_DIR)/$(GOR_BIN) $(PREFIX)/$(GOR_BIN); \
  	fi

gor-dep-delete:
	$(MAKE) DWN_URL=$(GOR_BIN_URL) \
		DWN_FILENAME=$(GOR_BIN_FILE) \
		DWN_BIN_NAME=$(GOR_BIN) \
		DWN_BIN_OUTPUT_DIR=$(GOR_OUTPUT_DIR) dwn-delete
	if [[ $(uname_s) = darwin || $(uname_s) = linux ]]; then \
		sudo rm -rf $(PREFIX)/$(GOR_BIN); \
	fi


	