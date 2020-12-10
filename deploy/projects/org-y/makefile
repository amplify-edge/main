include ../../fly.mk
include ../../gbd.mk
include ../../gor.mk
include ../../hug.mk

CONFIG_DIR = $(PWD)/config
VENDOR_DIR = vendor
VERSION_DIR = $(PWD)/version
BIN_DIR = $(PWD)/bin-all
CLI_BIN = $(BIN_DIR)/maintemplatev2-cli
SERVER_BIN = $(BIN_DIR)/maintemplatev2
TEMPLATE_DIR = github.com/getcouragenow/main/deploy/templates/maintemplatev2
FRONTEND_PREFIX = flutter/build/
FRONTEND_WEB_PREFIX = $(FRONTEND_PREFIX)web/
FRONTEND_ABS_PREFIX = $(PWD)/$(FRONTEND_PREFIX)
SERVER_ENTRYPOINT = $(PWD)/cmd/server/*.go
CLI_ENTRYPOINT = $(PWD)/cmd/cli/*.go

.PHONY: all
all: dep-delete dep gen build

dep:
	# Install go-bindata, jsonnet-bundler, go-jsonnet here
	# Create dirs for binaries
	mkdir -p $(BIN_DIR) $(VERSION_DIR) $(CONFIG_DIR)

dep-delete:
	rm -rf $(VENDOR_DIR) $(BIN_DIR) $(VERSION_DIR)

gen:
	@jb update
	@cd $(VENDOR_DIR)/$(TEMPLATE_DIR)/client && flutter pub get
	@cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && $(MAKE) this-gen
	@cp -Rv $(VENDOR_DIR)/$(TEMPLATE_DIR)/config/* $(CONFIG_DIR)

build: dep
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && \
		$(MAKE) FRONTEND_PREFIX=$(FRONTEND_WEB_PREFIX) \
				FRONTEND_ABS_PREFIX=$(FRONTEND_ABS_PREFIX) \
				VERSION_OUTPUT_DIR=$(VERSION_DIR) \
				EMBED_OUTPUT_DIR=cmd/server/  \
				SERVER_ENTRYPOINT=$(SERVER_ENTRYPOINT) \
				CLI_ENTRYPOINT=$(CLI_ENTRYPOINT) \
				SDK_BIN=$(CLI_BIN) \
				SERVER_BIN=$(SERVER_BIN) this-build

config:
	# nothing to do. manually manage it at project level
	# maybe later can diff against maintemplate for missing name value pairs...
	# sop and age encryption.
		# 6 of them...
		# cert store.
	# flutter env.
	
docker:
	# at project level
	# no registry..
	# volumes:
		# config 
		# data ( db and FS ). 

fly:
	# volumes local or SAN ?
	# depends on genji 
	# depends on instance delete polcies / behaviour
	# depends on promotion of RELEASE_CHANNEL of fly ( WEAVE thing )
