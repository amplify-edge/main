# This make file uses composition to keep things KISS and easy.
# In the boilerpalte make files dont do any includes, because you will create multi permutations of possibilities.

# git include
BOILERPLATE_FSPATH=./../../boilerplate
include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/go.mk
include $(BOILERPLATE_FSPATH)/flu.mk


# flu build
override FLU_SAMPLE_NAME =client/example
override FLU_LIB_NAME =client

# go build
override GO_FSPATH:=${PWD}/server/cmd
override GO_BIN_NAME=mod-main
override GO_BUILD_OUT_FSPATH:=${GOPATH}/bin/$(GO_BIN_NAME)
override GO_BUILD_OUT_ALL_FSPATH=${PWD}/server/assets


## Print all settings
this-print: ## print
	@echo -- REPO -- 
	@echo REPOSITORY: $(REPOSITORY)
	@echo
	

	$(MAKE) os-print

	$(MAKE) go-print
	
	$(MAKE) flu-print

	$(MAKE) flu-gen-lang-print


## CI

## This builds everything
this-build: ##
	# Only build what maintemplate needs

	# FLU
	$(MAKE) flu-gen-all
	$(MAKE) flu-gen-lang-all
	$(MAKE) flu-web-build

	# GO
	# Gen Test data
	# Gen other... 

## This builds this and all submodules
this-build-all: ##

	# DO bottom up so we get the embeddings i think.
	cd ../sys-core && make this-build
	


	# finally build the top :)
	$(MAKE) this-build

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