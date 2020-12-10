include ../../dwn.mk
include ../../fly.mk
include ../../hug.mk

CONFIG_DIR = config
VENDOR_DIR = vendor
VERSION_DIR = version
BIN_DIR = bin-all
TEMPLATE_DIR = github.com/getcouragenow/main/deploy/templates/maintemplatev2
FRONTEND_PREFIX = flutter/build/
FRONTEND_WEB_PREFIX = $(FRONTEND_PREFIX)/web/

.PHONY: all
all: dep-delete dep gen build

dep:
	# Install go-bindata, jsonnet-bundler, go-jsonnet here
	# Create dirs for binaries
	mkdir -p $(BIN_DIR) $(VERSION_DIR)

dep-delete:
	rm -rf $(VENDOR_DIR) $(BIN_DIR) $(VERSION_DIR)

gen:
	@jb update
	@cd $(VENDOR_DIR)/$(TEMPLATE_DIR)/client && flutter pub get
	@cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && $(MAKE) this-gen
	@cp -Rv $(VENDOR_DIR)/$(TEMPLATE_DIR)/config/* $(CONFIG_DIR)

build: dep
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && $(MAKE) flu-web-build
	cp -Rv $(VENDOR_DIR)/$(TEMPLATE_DIR)/client/build $(FRONTEND_PREFIX)
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && \
		$(MAKE) FRONTEND_PREFIX=$(FRONTEND_WEB_PREFIX) \
				VERSION_OUTPUT_DIR=$(VERSION_DIR) \
				EMBED_OUTPUT_DIR=cmd/server/ this-embed

	# Project does ! go mod download...."
		# ... pulls all code all the way down respective githashes
	# jump to maintempate/client
		# ... flutter pub update to force the pubspec git references to pull turtles all the way down...
			# 		cloud_firestore:
			#git:
			#url: https://github.com/theshiftstudio/flutter_plugins.git
			#ref: 9cabcc57e63fbc9be4fafee08e6435a1a8c71d61
			#path: packages/cloud_firestore
		# build flutter into build dir.
		# will make the flutter/assets/env.json for us...
			#  "channel: loadVar(prefixName="FRONTEND", env="CHANNEL").val,"
				# change to "RELEASE_CHANNEL" so we can use it with fly release channels.
			# "url: loadVar(prefixName="FRONTEND", env="DOMAIN").val,"
				# change to: "URL_WEB"
		# copy the build output up to projects/client
	# build go
		# projects/cmd/server/main.go, which will embed flutter as assets.go.
	# version
		# down at maintemmplate
	# mains.go
		# at Project level.... room to do override.
	
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
