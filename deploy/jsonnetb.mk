# jsonnet-bundler (jb)
# 

include=./dwn.mk

### BIN
PREFIX=/usr/local/bin
JSONNETB_BIN=jb
JSONNETB_OUTPUT_DIR=downloaded
#https://github.com/jsonnet-bundler/jsonnet-bundler/releases/tag/v0.4.0
# WINDOWS: see: https://github.com/jsonnet-bundler/jsonnet-bundler/issues/134
# DARWIN: https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v0.4.0/jb-darwin-amd64
# LINUX: https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v0.4.0/jb-linux-amd64
JSONNETB_BIN_VERSION=0.4.0
# switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
ifeq ($(OS),Windows_NT)
    JSONNETB_BIN_PLATFORM:=NOTAVAILABLE
endif
ifeq ($(uname_s),Darwin)
	JSONNETB_BIN_PLATFORM:=darwin-amd64
endif
ifeq ($(uname_s),Linux)
	JSONNETB_BIN_PLATFORM:=linux-amd64
endif
JSONNETB_BIN_FILE=jb-$(JSONNETB_BIN_PLATFORM)
JSONNETB_BIN_URL=https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v$(JSONNETB_BIN_VERSION)/$(JSONNETB_BIN_FILE)

jsonnetb-print:
	@echo '-- jsonnet-bundler (jsonnetb) Dep --'
	@echo JSONNETB_BIN_VERSION: 	$(JSONNETB_BIN_VERSION)
	@echo JSONNETB_BIN_URL: 		$(JSONNETB_BIN_URL)
	@echo JSONNETB_BIN_URLFILE: 	$(JSONNETB_BIN_FILE)
	@echo JSONNETB_BIN: 			$(JSONNETB_BIN)
	@echo
	
jsonnetb-dep: jsonnetb-dep-delete
	if [[ $(uname_s) = Darwin || $(uname_s) = Linux ]]; then \
		$(MAKE) DWN_FILENAME=$(JSONNETB_BIN_FILE) \
                DWN_URL=$(JSONNETB_BIN_URL) \
                DWN_BIN_NAME=$(JSONNETB_BIN) \
                DWN_BIN_OUTPUT_DIR=$(JSONNETB_OUTPUT_DIR) dwn-download && \
		sudo install -m755 $(JSONNETB_OUTPUT_DIR)/$(JSONNETB_BIN) \
			$(PREFIX)/$(JSONNETB_BIN); \
	fi

jsonnetb-dep-delete:
	$(MAKE) DWN_FILENAME=$(JSONNETB_BIN_FILE) \
			DWN_URL=$(JSONNETB_BIN_URL) \
			DWN_BIN_NAME=$(JSONNETB_BIN) \
			DWN_BIN_OUTPUT_DIR=$(JSONNETB_OUTPUT_DIR) dwn-delete
	sudo rm -rf $(PREFIX)/$(JSONNETB_BIN)



	