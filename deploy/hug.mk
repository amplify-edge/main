# HUGO (hug)

include=./dwn.mk

### BIN
PREFIX=/usr/local/bin
HUG_BIN=hugo
HUG_OUTPUT_DIR=downloaded
# https://github.com/gohugoio/hugo/releases/tag/v0.79.0
# https://github.com/gohugoio/hugo/releases/download/v0.79.0/hugo_extended_0.79.0_macOS-64bit.tar.gz
HUG_BIN_VERSION=0.79.0
# switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
ifeq ($(OS),Windows)
    HUG_BIN_PLATFORM:=Windows-64bit
endif
ifeq ($(uname_s),Darwin)
    HUG_BIN_PLATFORM:=macOS-64bit
endif
ifeq ($(uname_s),Linux)
    HUG_BIN_PLATFORM:=Linux-64bit
endif
HUG_BIN_FILE=hugo_extended_$(HUG_BIN_VERSION)_$(HUG_BIN_PLATFORM).tar.gz
HUG_BIN_URL=https://github.com/gohugoio/hugo/releases/download/v$(HUG_BIN_VERSION)/$(HUG_BIN_FILE)



hug-print:
	@echo -- HUGO Dep --
	@echo HUG_BIN_URL: $(HUG_BIN_URL)
	@echo HUG_BIN_URLFILE: $(HUG_BIN_FILE)
	@echo HUG_BIN: $(HUG_BIN)
	@echo

	
hug-dep: hug-dep-delete
	$(MAKE) DWN_URL=$(HUG_BIN_URL) \
		DWN_FILENAME=$(HUG_BIN_FILE) \
 		DWN_BIN_NAME=$(HUG_BIN) \
 		DWN_BIN_OUTPUT_DIR=$(HUG_OUTPUT_DIR) dwn-download
	if [[ $(uname_s) = Darwin || $(uname_s) = Linux ]]; then \
  		sudo install -m755 $(HUG_OUTPUT_DIR)/$(HUG_BIN) $(PREFIX)/$(HUG_BIN); \
  	fi

hug-dep-delete:
	$(MAKE) DWN_URL=$(HUG_BIN_URL) \
		DWN_FILENAME=$(HUG_BIN_FILE) \
 		DWN_BIN_NAME=$(HUG_BIN) \
 		DWN_BIN_OUTPUT_DIR=$(HUG_OUTPUT_DIR) dwn-delete
	if [[ $(uname_s) = Darwin || $(uname_s) = Linux ]]; then \
  		sudo rm -rf $(PREFIX)/$(HUG_BIN); \
  	fi

hug-fix:
	# fixes too many files issue with hugo.
	# https://github.com/gohugoio/hugo/issues/6109#issuecomment-515193778
	hugo check ulimit
	sudo sysctl -w kern.maxfiles=65536
	sudo sysctl -w kern.maxfilesperproc=65536
	ulimit -n 65536 65536
	



