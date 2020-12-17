# go-bindata (gbd)
# https://github.com/kevinburke/go-bindata/releases/tag/v3.22.0
include=./dwn.mk

## TODO
# get our fork making binary releases
# copy the hugo or fly mk code to make it dep etc

### BIN
PREFIX=/usr/local/bin
GB_BIN=go-bindata
GB_OUTPUT_DIR=downloaded
GB_BIN_VERSION=3.22.0
ifeq ($(OS),Windows_NT)
    GB_BIN_PLATFORM:=windows-amd64
endif
ifeq ($(uname_s),Darwin)
	GB_BIN_PLATFORM:=darwin-amd64
endif
ifeq ($(uname_s),Linux)
	GB_BIN_PLATFORM:=linux-amd64
endif
GB_BIN_FILE=go-bindata-$(GB_BIN_PLATFORM)
GB_BIN_URL=https://github.com/kevinburke/go-bindata/releases/download/v$(GB_BIN_VERSION)/$(GB_BIN_FILE)


gb-print:
	@echo -- GORELEASE Dep --
	@echo PREFIX: $(PREFIX)
	@echo GB_BIN_VERSION: 	$(GB_BIN_VERSION)
	@echo GB_BIN_URL: 		$(GB_BIN_URL)
	@echo GB_BIN_URLFILE: 	$(GB_BIN_FILE)
	@echo GB_BIN: 			$(GB_BIN)
	@echo

gb-dep: gb-dep-delete
	if [[ $(uname_s) = Darwin || $(uname_s) = Linux ]]; then \
		$(MAKE) DWN_FILENAME=$(GB_BIN_FILE) \
                DWN_URL=$(GB_BIN_URL) \
                DWN_BIN_NAME=$(GB_BIN) \
                DWN_BIN_OUTPUT_DIR=$(GB_OUTPUT_DIR) dwn-download && \
		sudo install -m755 $(DWN_BIN_OUTPUT_DIR)/$(GB_BIN) \
			$(PREFIX)/$(GB_BIN); \
	fi

gb-dep-delete:
	$(MAKE) DWN_FILENAME=$(GB_BIN_FILE) \
			DWN_URL=$(GB_BIN_URL) \
			DWN_BIN_NAME=$(GB_BIN) \
			DWN_BIN_OUTPUT_DIR=$(GB_OUTPUT_DIR) dwn-delete
	sudo rm -rf $(PREFIX)/$(GB_BIN)



	
	



