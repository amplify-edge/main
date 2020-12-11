#include fly.mk
#include gbd.mk
#include gor.mk
#include hug.mk

CONFIG_DIR = $(PWD)/config
VENDOR_DIR = jb-build
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

GO_LDFLAGS = CGO_ENABLED=0 go build -ldflags "-X main.build=${VERSION_GITHASH}" -a -tags netgo

FLY_CODE_PATH=$(PWD)/
FLY_APP_BUILTIN=go
FLY_APP_NAME=org-y
FLY_APP_ORG=org
FLY_APP_PORT=9074
FLY_DNS_DOMAIN=fly.dev
FLY_DNS_SUBDOMAIN=$(FLY_APP_NAME)

IMAGE_NAME = $(FLY_APP_NAME)
IMAGE_AUTHOR = $(shell basename $(dir $(shell git rev-parse --show-toplevel)))
IMAGE_DATE = $(shell date -u +%Y%m%d%H%M%S)
IMAGE_EXPOSED_PORT = $(FLY_APP_PORT)
IMAGE_ORG = $(FLY_APP_ORG)
IMAGE_EXECUTABLE = maintemplatev2
IMAGE_REF = $(shell git rev-parse HEAD)
IMAGE_FLAGS = ""

DEPLOY_ENV=DEV
DEPLOY_BASEURL=
ifeq ($(DEPLOY_ENV),PROD)
    DEPLOY_BASEURL=http://$(FLY_PROD_DNS_SUBDOMAIN).$(FLY_PROD_DNS_DOMAIN)
endif
ifeq ($(DEPLOY_ENV),DEV)
     DEPLOY_BASEURL=http://$(FLY_DNS_SUBDOMAIN).$(FLY_DNS_DOMAIN)
endif

.PHONY: all

print:
	@echo
	$(MAKE) fly-print
	@echo

	@echo -- DEPLOY environment --
	@echo DEPLOY_ENV: $(DEPLOY_ENV)
	@echo DEPLOY_BASEURL: $(DEPLOY_BASEURL)
	@echo

dep-os:
	# Install go-bindata, jsonnet-bundler, go-jsonnet here
#	GO111MODULE="off" go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb
#	go get -u -v github.com/go-bindata/go-bindata/...
#	go get -u -v github.com/google/go-jsonnet/cmd/jsonnet
#	$(MAKE) hug-dep
#	$(MAKE) fly-dep
#	$(MAKE) gor-dep

dep-os-delete:
	$(MAKE) hug-dep-delete
	$(MAKE) fly-dep-delete
	$(MAKE) gor-dep-delete

all: dep-delete dep gen build

dep: dep-os
	# Create dirs for binaries
	mkdir -p $(BIN_DIR) $(VERSION_DIR) $(CONFIG_DIR)
	@#go mod vendor

dep-delete:
	rm -rf $(VENDOR_DIR) $(BIN_DIR) $(VERSION_DIR) $(PWD)/certs

gen:
	@jb --jsonnetpkg-home=$(VENDOR_DIR) update
	@cd $(VENDOR_DIR)/$(TEMPLATE_DIR)/client && flutter pub get
	@cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && $(MAKE) this-gen
	@cp -Rv $(VENDOR_DIR)/$(TEMPLATE_DIR)/config/* $(CONFIG_DIR)

build: dep
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && $(MAKE) flu-web-build
	cp -Rv $(VENDOR_DIR)/$(TEMPLATE_DIR)/client/build $(FRONTEND_ABS_PREFIX)
	cp -Rv $(VENDOR_DIR)/$(TEMPLATE_DIR)/certs $(PWD)/certs
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && \
		$(MAKE) FRONTEND_PREFIX=$(FRONTEND_WEB_PREFIX) \
				FRONTEND_ABS_PREFIX=$(FRONTEND_ABS_PREFIX) \
				VERSION_OUTPUT_DIR=$(VERSION_DIR) \
				EMBED_OUTPUT_DIR=cmd/server/  \
				SERVER_ENTRYPOINT=$(SERVER_ENTRYPOINT) \
                CLI_ENTRYPOINT=$(CLI_ENTRYPOINT) \
                SDK_BIN=$(CLI_BIN) \
				SERVER_BIN=$(SERVER_BIN) this-version-gen
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && \
		$(MAKE) FRONTEND_PREFIX=$(FRONTEND_WEB_PREFIX) \
				FRONTEND_ABS_PREFIX=$(FRONTEND_ABS_PREFIX) \
				VERSION_OUTPUT_DIR=$(VERSION_DIR) \
				EMBED_OUTPUT_DIR=cmd/server/  \
				SERVER_ENTRYPOINT=$(SERVER_ENTRYPOINT) \
                CLI_ENTRYPOINT=$(CLI_ENTRYPOINT) \
                SDK_BIN=$(CLI_BIN) \
				SERVER_BIN=$(SERVER_BIN) this-embed
	$(GO_LDFLAGS) -o $(SERVER_BIN) $(SERVER_ENTRYPOINT)

docker:
	docker build -t "org-y:${IMAGE_REF}" \
		--build-arg IMAGE_REF=$(IMAGE_REF) \
		--build-arg IMAGE_DATE=$(IMAGE_DATE) \
		--build-arg IMAGE_EXECUTABLE=$(IMAGE_EXECUTABLE) \
		--build-arg IMAGE_EXPOSED_PORT=$(IMAGE_EXPOSED_PORT) \
		--build-arg IMAGE_AUTHOR=$(IMAGE_AUTHOR) \
		--build-arg IMAGE_ORG=$(IMAGE_ORG) \
		--build-arg IMAGE_FLAGS=$(IMAGE_FLAGS) \
		--build-arg IMAGE_NAME=$(IMAGE_NAME) .

fly:
	# volumes local or SAN ?
	# depends on genji 
	# depends on instance delete polcies / behaviour
	# depends on promotion of RELEASE_CHANNEL of fly ( WEAVE thing )
