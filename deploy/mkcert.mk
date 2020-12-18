# mkcert (gbd)
# https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-darwin-amd64
include=./dwn.mk

## TODO
# get our fork making binary releases
# copy the hugo or fly mk code to make it dep etc
uname_s = $(shell uname -s)
uname_m = $(shell uname -m)

### BIN
PREFIX=/usr/local/bin
MKCERT_BIN=mkcert
MKCERT_OUTPUT_DIR=downloaded
MKCERT_BIN_VERSION=1.4.3
ifeq ($(OS),Windows_NT)
    MKCERT_BIN_PLATFORM:=windows-amd64
endif
ifeq ($(uname_s),Darwin)
	MKCERT_BIN_PLATFORM:=darwin-amd64
endif
ifeq ($(uname_s),Linux)
	MKCERT_BIN_PLATFORM:=linux-amd64
endif
MKCERT_BIN_FILE=mkcert-v$(MKCERT_BIN_VERSION)-$(MKCERT_BIN_PLATFORM)
MKCERT_BIN_URL=https://github.com/FiloSottile/mkcert/releases/download/v$(MKCERT_BIN_VERSION)/$(MKCERT_BIN_FILE)
#https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-darwin-amd64

mkcert-print:
	@echo -- MKCERT Dep --
	@echo PREFIX: $(PREFIX)
	@echo MKCERT_BIN_VERSION: 	$(MKCERT_BIN_VERSION)
	@echo MKCERT_BIN_URL: 		$(MKCERT_BIN_URL)
	@echo MKCERT_BIN_URLFILE: 	$(MKCERT_BIN_FILE)
	@echo MKCERT_BIN: 			$(MKCERT_BIN)
	@echo

mkcert-dep: mkcert-dep-delete
	$(MAKE) DWN_URL=$(MKCERT_BIN_URL) \
		DWN_FILENAME=$(MKCERT_BIN_FILE) \
 		DWN_BIN_NAME=$(MKCERT_BIN) \
 		DWN_BIN_OUTPUT_DIR=$(MKCERT_OUTPUT_DIR) dwn-download
	if [[ $(uname_s) = Darwin || $(uname_s) = Linux ]]; then \
  		sudo install -m755 $(MKCERT_OUTPUT_DIR)/$(MKCERT_BIN) $(PREFIX)/$(MKCERT_BIN); \
  	fi

mkcert-dep-delete:
	$(MAKE) DWN_FILENAME=$(MKCERT_BIN_FILE) \
			DWN_URL=$(MKCERT_BIN_URL) \
			DWN_BIN_NAME=$(MKCERT_BIN) \
			DWN_BIN_OUTPUT_DIR=$(MKCERT_OUTPUT_DIR) dwn-delete
	sudo rm -rf $(PREFIX)/$(MKCERT_BIN)








