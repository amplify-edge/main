# Actually it's githash plus build date
VERSION_GITHASH = $(shell git rev-parse --short HEAD) # just like go.mod's hash format
BUILD_TIME = $(shell date -u +%Y%M%d_%H%M%S) # just like go.mod's time format
VENDOR_DIR = vendor
BIN_DIR = bin-all
TEMPLATE_DIR = github.com/getcouragenow/main/deploy/templates/maintemplatev2
GO_LDFLAGS = -ldflags "-X main.build=${VERSION_GITHASH}" -a -tags netgo

.PHONY: all

all: dep-delete dep build

dep:
	# Install go-bindata, jsonnet-bundler, go-jsonnet here
	# Create dirs for binaries
	mkdir -p $(BIN_DIR)

dep-delete:
	rm -rf {$(VENDOR_DIR),$(BIN_DIR)}

build: dep
	jb install
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR)/client && flutter pub get
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && $(MAKE) flu-gen-lang-all
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && $(MAKE) this-config-gen
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && $(MAKE) flu-web-build
	cp -Rv $(VENDOR_DIR)/$(TEMPLATE_DIR)/client/build flutter/build
	go-bindata -fs -nomemcopy -o cmd/server/assets.go -prefix "flutter/build/web" flutter/build/web/...
	CGO_ENABLED=0 go build -o $(BIN_DIR)/maintemplatev2 $(GO_LDFLAGS) cmd/server/*
	CGO_ENABLED=0 go build -o $(BIN_DIR)/maintemplatev2-sdk-cli $(GO_LDFLAGS) cmd/cli/*
	## TODO VERSION
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
