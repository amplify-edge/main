
SHARED_FSPATH=./../shared
BOILERPLATE_FSPATH=$(SHARED_FSPATH)/boilerplate

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/gitr.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/flu.mk
include $(BOILERPLATE_FSPATH)/go.mk

# remove the "v" prefix
VERSION ?= $(shell echo $(TAGGED_VERSION) | cut -c 2-)

override FLU_SAMPLE_NAME =client
override FLU_LIB_NAME =client

this-all: this-print this-dep this-build this-print-end

this-print: 
	@echo
	@echo "-- SYS: start --"
	@echo SDK_BIN: $(SDK_BIN)
	@echo

this-print-end:
	@echo
	@echo "-- SYS: end --"
	@echo
	@echo

this-print:
	
	$(MAKE) os-print
	
	$(MAKE) gitr-print
	
	$(MAKE) flu-print

	$(MAKE) flu-gen-lang-print

	$(MAKE) go-print

this-dep:
	cd $(SHARED_FSPATH) && $(MAKE) this-all


this-build: v2 v3


v2:
	# Does full gen and build (web)
	cd ./deploy/templates/maintemplatev2 && $(MAKE) this-all

v3:
	# Does full gen and build (web)
	cd ./deploy/templates/maintemplatev3 && $(MAKE) this-all


### Developers

# NOTE: At dev time you only want to run long generators IF you know you need then.
# So here are the make targets to use as you see fit.
# Manaully do a "make this-dep" to get the golang tools yourself.
# Manaully do a "make flu-config" to set to beta channnel yourself.
# Manaully do a "make flu-gen-all" to gen all code yourself.
# Manually do a "make flu-gen-lang-all" to gen all languages yourself.

### For Local dev. Does NOT do big Gen !
this-flu-desk-run:

	cd ./maintemplate && $(MAKE) flu-desk-run

### For Local dev. Does NOT do big Gen !
this-flu-web-run:
	

	cd ./maintemplate && $(MAKE) flu-web-run
