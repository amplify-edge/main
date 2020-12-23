# go-bindata (gbd)
# https://github.com/getcouragenow/go-bindata/releases/tag/v3.1.5
# https://github.com/getcouragenow/go-bindata/releases/download/v3.1.5/go-bindata_3.1.5_Darwin_x86_64.tar.gz

include=./dwn.mk

### BIN
PREFIX=/usr/local/bin
GBD_BIN=go-bindata
GBD_OUTPUT_DIR=downloaded
GBD_BIN_VERSION=3.1.5
ifeq ($(OS),Windows_NT)
    GBD_BIN_PLATFORM:=windows_x86_64
endif
ifeq ($(uname_s),Darwin)
	GBD_BIN_PLATFORM:=darwin_x86_64
endif
ifeq ($(uname_s),Linux)
	GBD_BIN_PLATFORM:=linux_x86_64
endif
GBD_BIN_FILE=go-bindata_$(GBD_BIN_VERSION)_$(GBD_BIN_PLATFORM).tar.gz
GBD_BIN_URL=https://github.com/getcouragenow/go-bindata/releases/download/v$(GBD_BIN_VERSION)/$(GBD_BIN_FILE)


gbd-print:
	@echo -- GO_BINDATA Dep --
	@echo PREFIX: $(PREFIX)
	@echo GBD_BIN_VERSION: 	$(GBD_BIN_VERSION)
	@echo GBD_BIN_URL: 		$(GBD_BIN_URL)
	@echo GBD_BIN_URLFILE: 	$(GBD_BIN_FILE)
	@echo GBD_BIN: 			$(GBD_BIN)
	@echo

gbd-dep: gbd-dep-delete
	if [[ $(uname_s) = Darwin || $(uname_s) = Linux ]]; then \
		$(MAKE) DWN_FILENAME=$(GBD_BIN_FILE) \
                DWN_URL=$(GBD_BIN_URL) \
                DWN_BIN_NAME=$(GBD_BIN) \
                DWN_BIN_OUTPUT_DIR=$(GBD_OUTPUT_DIR) dwn-download && \
		sudo install -m755 $(DWN_BIN_OUTPUT_DIR)/$(GBD_BIN) \
			$(PREFIX)/$(GBD_BIN); \
	fi

gbd-dep-delete:
	$(MAKE) DWN_FILENAME=$(GBD_BIN_FILE) \
			DWN_URL=$(GBD_BIN_URL) \
			DWN_BIN_NAME=$(GBD_BIN) \
			DWN_BIN_OUTPUT_DIR=$(GBD_OUTPUT_DIR) dwn-delete
	sudo rm -rf $(PREFIX)/$(GBD_BIN)



	
	



