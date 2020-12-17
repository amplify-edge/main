# go-jsonnet 

include=./dwn.mk

### BIN
PREFIX=/usr/local/bin
JSONNET_BIN=jsonnet
JSONNET_OUTPUT_DIR=downloaded
# https://github.com/google/go-jsonnet/releases/download/
# WINDOWS: https://github.com/google/go-jsonnet/releases/download/v0.17.0/go-jsonnet_0.17.0_Windows_x86_64.tar.gz
# DARWIN: See: https://github.com/google/go-jsonnet/pull/486
# LINUX: https://github.com/google/go-jsonnet/releases/download/v0.17.0/go-jsonnet_0.17.0_Linux_x86_64.tar.gz
JSONNET_BIN_VERSION=0.17.0
JSONNET_BIN_PLATFORM= $(uname_s)_$(uname_m)
# switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
JSONNET_BIN_FILE=go-jsonnet_$(JSONNET_BIN_VERSION)_$(JSONNET_BIN_PLATFORM)
JSONNET_BIN_URL=https://github.com/google/go-jsonnet/releases/download/v$(JSONNET_BIN_VERSION)/$(JSONNET_BIN_FILE)



jsonnet-print:
	@echo -- GORELEASE Dep --
	@echo PREFIX: $(PREFIX)
	@echo JSONNET_BIN_VERSION: 	$(JSONNET_BIN_VERSION)
	@echo JSONNET_BIN_URL: 		$(JSONNET_BIN_URL)
	@echo JSONNET_BIN_URLFILE: 	$(JSONNET_BIN_FILE)
	@echo JSONNET_BIN: 			$(JSONNET_BIN)
	@echo
	
jsonnet-dep: jsonnet-dep-delete
	if [[ $(uname_s) = Darwin ]]; then \
  		brew install go-jsonnet ; \
  	elif [[ $(uname_s) = Linux ]]; then \
		$(MAKE) DWN_FILENAME=$(JSONNET_BIN_FILE) \
                DWN_URL=$(JSONNET_BIN_URL) \
                DWN_BIN_NAME=$(JSONNET_BIN) \
                DWN_BIN_OUTPUT_DIR=$(JSONNET_OUTPUT_DIR) dwn-download; \
		sudo install -m755 $(JSONNET_OUTPUT_DIR)/$(JSONNET_BIN) \
		 $(PREFIX)/$(JSONNET_BIN); \
  	fi

jsonnet-dep-delete:
	$(MAKE) DWN_FILENAME=$(JSONNET_BIN_FILE) \
			DWN_URL=$(JSONNET_BIN_URL) \
			DWN_BIN_NAME=$(JSONNET_BIN) \
			DWN_BIN_OUTPUT_DIR=$(JSONNET_OUTPUT_DIR) dwn-delete
	if [[ $(uname_s) = Linux ]]; then \
		sudo rm -rf $(PREFIX)/$(JSONNET_BIN); \
	elif [[ $(uname_s) = Darwin ]]; then \
	  	brew list go-jsonnet && uninstall go-jsonnet || echo "is uninstalled"; \
	fi
