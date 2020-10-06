
SHARED_FSPATH=./../../../../shared
BOILERPLATE_FSPATH=$(SHARED_FSPATH)/boilerplate

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/gitr.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/flu.mk
include $(BOILERPLATE_FSPATH)/go.mk

# flu build
override FLU_SAMPLE_NAME =client
override FLU_LIB_NAME =client

# go build
override GO_FSPATH:=${PWD}/server/cmd
override GO_BIN_NAME=maintemplatev2
override GO_BUILD_OUT_FSPATH:=${GOPATH}/bin/$(GO_BIN_NAME)
override GO_BUILD_OUT_ALL_FSPATH=${PWD}/server/assets


this-all: this-build

## Print all settings
this-print: ## print

	$(MAKE) os-print
	
	$(MAKE) flu-print

	$(MAKE) flu-gen-lang-print

	$(MAKE) go-print



### CI

## This builds everything
this-build: ##
	$(MAKE) go-build
	$(MAKE) flu-gen-all
	$(MAKE) flu-gen-lang-all
	$(MAKE) flu-web-build


## This builds maintemplate and all submodules
this-build-deep: ##

	# DO bottom up so we get the embeddings i think.
	cd ../sys-core && make this-build

	# COMENTED OUT stuff we dont need for v2
	#cd ../mod-account && make this-build
	#cd ../mod-chat && make this-build
	cd ../mod-main && make this-build
	#cd ../mod-geo && make this-build
	#cd ../mod-chat && make this-build
	#cd ../mod-write && make this-build
	#cd ../mod-ion && make this-build
	#cd ../mod-kanban && make this-build

	# finally build the top :)
	$(MAKE) this-build
	
	

### DEV

### DEV

this-example-build:
	## GO
	$(MAKE) go-build

	## FLU
	$(MAKE) flu-gen-all
	$(MAKE) flu-gen-lang-all
	$(MAKE) flu-web-build

this-example-go-run:
	$(MAKE) go-run

this-example-flu-run:
	# web is broken currently.
	$(MAKE) flu-desk-run

