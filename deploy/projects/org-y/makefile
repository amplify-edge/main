# boot repo makefiles
 BOILERPLATE_FSPATH=./../../../../boot/boilerplate
 include $(BOILERPLATE_FSPATH)/help.mk
 include $(BOILERPLATE_FSPATH)/os.mk
 include $(BOILERPLATE_FSPATH)/gitr.mk

# main repo make files ( will later be in boot) and fly and hug mapped to tools.mk.
# also use the dwn.mk for ALL the other tools we need, so we dont need gopaths and that slowness.
 DEPLOY_BOILERPLATE_FSPATH=./../..
 include $(DEPLOY_BOILERPLATE_FSPATH)/dwn.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/hug.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/hcl.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/fly.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/go-bindata.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/gor.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/jsonnet.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/jsonnetb.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/mkcert.mk

CONFIG_DIR = $(PWD)/config
#VENDOR_DIR = jb-build
VENDOR_DIR = $(GOPATH)/src
VERSION_DIR = $(PWD)/version
BIN_DIR = $(PWD)/bin-all
CLI_BIN = $(BIN_DIR)/maintemplatev2-cli
SERVER_BIN = $(BIN_DIR)/maintemplatev2
TEMPLATE_DIR = github.com/gutterbacon/main/deploy/templates/maintemplatev2

SERVER_ENTRYPOINT = $(PWD)/cmd/server/*.go
CLI_ENTRYPOINT = $(PWD)/cmd/cli/*.go

GO_LDFLAGS = CGO_ENABLED=0 go build -ldflags "-X main.build=${VERSION_GITHASH}" -a -tags netgo

FLY_CODE_PATH=$(PWD)/
FLY_APP_BUILTIN=go
FLY_APP_NAME=org-y
FLY_APP_ORG=org
FLY_APP_PORT=8080
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

FRONTEND_PREFIX = flutter/build/
FRONTEND_WEB_PREFIX = $(FRONTEND_PREFIX)web/
FRONTEND_ABS_PREFIX = $(PWD)/$(FRONTEND_PREFIX)
FRONTEND_HOST = "org-y.fly.dev"
FRONTEND_PORT = 443
FRONTEND_URL_WEB = "org-y.fly.dev"
FRONTEND_URL_NATIVE = "org-y.fly.dev"

EMBED_OUTPUT_DIR = $(PWD)/cmd/server/

DEPLOY_ENV=DEV
DEPLOY_BASEURL=
ifeq ($(DEPLOY_ENV),PROD)
    DEPLOY_BASEURL=http://$(FLY_PROD_DNS_SUBDOMAIN).$(FLY_PROD_DNS_DOMAIN)
endif
ifeq ($(DEPLOY_ENV),DEV)
     DEPLOY_BASEURL=http://$(FLY_DNS_SUBDOMAIN).$(FLY_DNS_DOMAIN)
endif

JB_VERSION = 0.4.0
GO_JSONNET_VERSION = 0.17.0
GO_BINDATA_VERSION = 3.1.3
uname_s = $(shell uname -s)
uname_m = $(shell uname -m)

.PHONY: all

print:
	@echo
	$(MAKE) fly-print
	@echo

	@echo -- DEPLOY environment --
	@echo DEPLOY_ENV: $(DEPLOY_ENV)
	@echo DEPLOY_BASEURL: $(DEPLOY_BASEURL)
	@echo

dep-os: dep-os-delete
	# Install go-bindata, jsonnet-bundler, go-jsonnet here
	$(MAKE) jsonnet-dep
	$(MAKE) jsonnetb-dep
	$(MAKE) gb-dep
	$(MAKE) fly-dep
	$(MAKE) hug-dep
	$(MAKE) gor-dep
	$(MAKE) mkcert-dep
	# BS-LANG
	git clone https://github.com/getcouragenow/shared downloaded/shared && \
		cd downloaded/shared/tool/bs-lang && go build && sudo install -m755 bs-lang /usr/local/bin/bs-lang

dep-os-delete:
	$(MAKE) hug-dep-delete
	$(MAKE) fly-dep-delete
	$(MAKE) gor-dep-delete
	$(MAKE) jsonnet-dep-delete
	$(MAKE) jsonnetb-dep-delete
	$(MAKE) gb-dep-delete
	$(MAKE) mkcert-dep-delete
	rm -rf downloaded

all: dep-delete dep gen build

dep: dep-os
	# Create dirs for binaries
	mkdir -p $(BIN_DIR) $(VERSION_DIR) $(CONFIG_DIR) $(FRONTEND_ABS_PREFIX)
#	@go mod vendor

dep-delete:
	rm -rf $(VENDOR_DIR) $(BIN_DIR) $(VERSION_DIR) $(PWD)/certs $(FRONTEND_ABS_PREFIX)

gen:
#	@jb --jsonnetpkg-home=$(VENDOR_DIR) update
	@cd $(VENDOR_DIR)/$(TEMPLATE_DIR)/client && flutter pub get && flutter pub upgrade
	@cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && $(MAKE) this-gen
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && \
		$(MAKE) FRONTEND_HOST=$(FRONTEND_HOST) \
			FRONTEND_PORT=$(FRONTEND_PORT) \
			FRONTEND_URL_WEB=$(FRONTEND_URL_WEB) \
			FRONTEND_URL_NATIVE=$(FRONTEND_URL_NATIVE) this-flutter-gen

# build recipe
build: # dep
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && $(MAKE) flu-web-build
	cp -Rv $(VENDOR_DIR)/$(TEMPLATE_DIR)/client/build $(FRONTEND_ABS_PREFIX)
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && \
		$(MAKE) VERSION_OUTPUT_DIR=$(VERSION_DIR) this-version-gen
	go-bindata -fs -nomemcopy -o $(EMBED_OUTPUT_DIR)/assets.go -prefix "$(FRONTEND_WEB_PREFIX)" $(PWD)/flutter/build/web/...
	go-bindata -fs -nomemcopy -pkg version -o $(VERSION_DIR)/version.go -prefix "version/" $(VERSION_DIR)/manifest.json
	$(GO_LDFLAGS) -o $(SERVER_BIN) $(SERVER_ENTRYPOINT)
	GOOS=linux GOARCH=amd64 $(GO_LDFLAGS) -o $(SERVER_BIN) $(SERVER_ENTRYPOINT)

# docker recipe for local testing
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
	docker system prune --volumes -f

fly:
	flyctl deploy

