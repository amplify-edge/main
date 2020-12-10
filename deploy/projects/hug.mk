# HUGO (hug)

include=./dwn.mk

### BIN
HUG_BIN=$(PWD)/hugo
# https://github.com/gohugoio/hugo/releases/tag/v0.79.0
# https://github.com/gohugoio/hugo/releases/download/v0.79.0/hugo_extended_0.79.0_macOS-64bit.tar.gz
HUG_BIN_VERSION=0.79.0
HUG_BIN_PLATFORM=??
# switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
ifeq ($(OS_detected),Windows)
    HUG_BIN_PLATFORM=Windows-64bit
endif
ifeq ($(OS_detected),Darwin)
    HUG_BIN_PLATFORM=macOS-64bit
endif
ifeq ($(OS_detected),Linux)
    HUG_BIN_PLATFORM=Linux-64bit
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
	$(MAKE) DWN_URL=$(HUG_BIN_URL) DWN_FILENAME=$(HUG_BIN_FILE) DWN_BIN_FSPATH=$(HUG_BIN) dwn-download 
hug-dep-delete:
	$(MAKE) DWN_URL=$(HUG_BIN_URL) DWN_FILENAME=$(HUG_BIN_FILE) DWN_BIN_FSPATH=$(HUG_BIN) dwn-delete 

hug-fix:
	# fixes too many files issue with hugo.
	# https://github.com/gohugoio/hugo/issues/6109#issuecomment-515193778
	hugo check ulimit
	sudo sysctl -w kern.maxfiles=65536
	sudo sysctl -w kern.maxfilesperproc=65536
	ulimit -n 65536 65536
	



