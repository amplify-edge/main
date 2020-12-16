
# downloads things from github releases or anywhere. ( dwn for short)

# variables to overide.
DWN_URL=getcourage.org	# Github URL to the file
DWN_FILENAME=hello		# Github FileName
DWN_BIN_FSPATH=?		# Local filename ( the actual bin)

# calculated private variables
DWN_FILENAME_CALC=$(notdir $(DWN_URL)) # todo use this, so we dont need to pass in this anymore :)
DWN_FILENAME_BASE=$(basename $(DWN_FILENAME))
DWN_FILENAME_EXT=$(suffix $(DWN_FILENAME))


dwn-print:
	@echo
	@echo -- DWN Downloader --
	@echo
	@echo DWN_URL: $(DWN_URL)
	@echo DWN_FILENAME: $(DWN_FILENAME)
	@echo DWN_BIN_FSPATH: $(DWN_BIN_FSPATH)
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


	# Curl from github release
	# switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
ifeq ($(OS_detected),Windows)
	@echo Detected Windows ...
   	# what does windows use to download stuff ??

endif

ifeq ($(OS_detected),Darwin)
    # mac
	@echo 
	@echo Detected Darwin ...
	curl -LO $(DWN_URL)
	#tar -zxvf $(DWN_FILENAME)

	# check file extension
ifeq ($(DWN_FILENAME_EXT),.gz)
	@echo Detected file ext .gz
	tar -zxvf $(DWN_FILENAME)
endif
ifeq ($(DWN_FILENAME_EXT),.zip)
	@echo Detected file ext .zip
	tar -zxvf $(DWN_FILENAME)
endif
ifeq ($(DWN_FILENAME_EXT),)
	@echo Detected file ext NONE
    # if "none", its a pure binary, so just rename it to the required DWN_BIN_FSPATH and chmod it.
	mv $(DWN_FILENAME) $(DWN_BIN_FSPATH)
	chmod +x $(DWN_BIN_FSPATH)
endif

endif
ifeq ($(OS_detected),Linux)
    # linux
	@echo Detected Linux ...
	wget --no-check-certificate --content-disposition $(DWN_URL)
	# --no-check-cerftificate was necessary for me to have wget not puke about https
endif
	# deletes the tar
	rm -f $(DWN_FILENAME)

dwn-delete:
	# deletes the tar and binary
	rm -f $(DWN_FILENAME)
	rm -f $(DWN_BIN_FSPATH)


	


