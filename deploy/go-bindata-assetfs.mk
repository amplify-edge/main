# go-bindata-assetfs (gbda)
# https://github.com/amplify-cms/go-bindata-assetfs/releases/tag/v1.0.4
# https://github.com/amplify-cms/go-bindata-assetfs/releases/download/v1.0.4/go-bindata-assetfs_1.0.4_Windows_x86_64.tar.gz

include=./dwn.mk

### BIN
PREFIX=/usr/local/bin
GBDA_BIN=go-bindata-assetfs
GBDA_OUTPUT_DIR=downloaded
GBDA_BIN_VERSION=1.0.4
ifeq ($(OS),Windows_NT)
    GBDA_BIN_PLATFORM:=windows_x86_64
endif
ifeq ($(uname_s),Darwin)
	GBDA_BIN_PLATFORM:=darwin_x86_64
endif
ifeq ($(uname_s),Linux)
	GBDA_BIN_PLATFORM:=linux_x86_64
endif
GBDA_BIN_FILE=go-bindata-assetfs_$(GBDA_BIN_VERSION)_$(GBDA_BIN_PLATFORM).tar.gz
GBDA_BIN_URL=https://github.com/amplify-cms/go-bindata-assetfs/releases/download/v$(GBDA_BIN_VERSION)/$(GBDA_BIN_FILE)


gbda-print:
	@echo -- GO_BINDATA Dep --
	@echo PREFIX: $(PREFIX)
	@echo GBDA_BIN_VERSION: 	$(GBDA_BIN_VERSION)
	@echo GBDA_BIN_URL: 		$(GBDA_BIN_URL)
	@echo GBDA_BIN_URLFILE: 	$(GBDA_BIN_FILE)
	@echo GBDA_BIN: 			$(GBDA_BIN)
	@echo

gbda-dep: gbda-dep-delete
	if [[ $(uname_s) = Darwin || $(uname_s) = Linux ]]; then \
		$(MAKE) DWN_FILENAME=$(GBDA_BIN_FILE) \
                DWN_URL=$(GBDA_BIN_URL) \
                DWN_BIN_NAME=$(GBDA_BIN) \
                DWN_BIN_OUTPUT_DIR=$(GBDA_OUTPUT_DIR) dwn-download && \
		sudo install -m755 $(DWN_BIN_OUTPUT_DIR)/$(GBDA_BIN) \
			$(PREFIX)/$(GBDA_BIN); \
	fi

gbda-dep-delete:
	$(MAKE) DWN_FILENAME=$(GBDA_BIN_FILE) \
			DWN_URL=$(GBDA_BIN_URL) \
			DWN_BIN_NAME=$(GBDA_BIN) \
			DWN_BIN_OUTPUT_DIR=$(GBDA_OUTPUT_DIR) dwn-delete
	sudo rm -rf $(PREFIX)/$(GBDA_BIN)



	
	



