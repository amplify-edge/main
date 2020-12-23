
# downloads things from github releases or anywhere. ( dwn for short)
SHELL = bash

# variables to overide.
DWN_URL:=getcourage.org	# Github URL to the file
DWN_FILENAME:=hello		# Github FileName
DWN_BIN_NAME:=?		# Local filename ( the actual bin)
DWN_BIN_OUTPUT_DIR:=downloaded

# calculated private variables
DWN_FILENAME_CALC=$(notdir $(DWN_URL)) # todo use this, so we dont need to pass in this anymore :)
DWN_FILENAME_BASE=$(shell basename -- $(DWN_FILENAME))
DWN_FILENAME_EXT := $(suffix $(DWN_FILENAME))
ifeq ($(DWN_FILENAME_EXT),)
	DWN_FILENAME_EXT += NONE
endif

uname_s := $(shell uname -s)
uname_m := $(shell uname -m)

dwn-print:
	@echo
	@echo -- DWN Downloader --
	@echo
	@echo DWN_URL: $(DWN_URL)
	@echo DWN_FILENAME: $(DWN_FILENAME)
	@echo DWN_BIN_NAME: $(DWN_BIN_NAME)
	@echo
	@echo -- DWN Downloader calculated variables --
	@echo DWN_FILENAME_CALC: $(DWN_FILENAME_CALC)
	@echo DWN_FILENAME_BASE: $(DWN_FILENAME_BASE)
	@echo DWN_FILENAME_EXT: $(DWN_FILENAME_EXT)
	@echo

dwn-download: dwn-delete

	@echo Downloading dep ...

	@echo DWN_FILENAME_CALC: $(DWN_FILENAME_CALC)
	@echo DWN_FILENAME_BASE: $(DWN_FILENAME_BASE)
	@echo DWN_FILENAME_EXT: $(DWN_FILENAME_EXT)

#	 Curl from github release
#	 switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
	if [[ $(uname_s) = Darwin || $(uname_s) = Linux ]]; then \
		mkdir -p $(DWN_BIN_OUTPUT_DIR) && \
		curl -L -o $(DWN_BIN_OUTPUT_DIR)/$(DWN_FILENAME_CALC) $(DWN_URL) && \
		if [[ $(DWN_FILENAME_EXT) = .gz || $(DWN_FILENAME_EXT) = .tar.gz ]]; then \
			tar -zvxf $(DWN_BIN_OUTPUT_DIR)/$(DWN_FILENAME_CALC) -C $(DWN_BIN_OUTPUT_DIR); \
		elif [[ $(DWN_FILENAME_EXT) = .zip ]]; then \
			unzip -d $(DWN_BIN_OUTPUT_DIR) $(DWN_BIN_OUTPUT_DIR)/$(DWN_FILENAME_CALC); \
		else \
			mv $(DWN_BIN_OUTPUT_DIR)/$(DWN_FILENAME_CALC) $(DWN_BIN_OUTPUT_DIR)/$(DWN_BIN_NAME); \
		fi && \
		chmod +x $(DWN_BIN_OUTPUT_DIR)/$(DWN_BIN_NAME); \
	fi

dwn-delete:
	# deletes the tar and binary
	rm -rf $(DWN_BIN_OUTPUT_DIR)/$(DWN_FILENAME)
	rm -rf $(DWN_BIN_OUTPUT_DIR)/$(DWN_BIN_NAME)
