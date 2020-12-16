# boot repo makefiles
# BOILERPLATE_FSPATH=./../../../../boot/boilerplate
# include $(BOILERPLATE_FSPATH)/help.mk
# include $(BOILERPLATE_FSPATH)/os.mk
# include $(BOILERPLATE_FSPATH)/gitr.mk

# main repo make files ( will later be in boot) and fly and hug mapped to tools.mk.
# also use the dwn.mk for ALL the other tools we need, so we dont need gopaths and that slowness.
# DEPLOY_BOILERPLATE_FSPATH=./../..
# include $(DEPLOY_BOILERPLATE_FSPATH)/dwn.mk
# include $(DEPLOY_BOILERPLATE_FSPATH)/hug.mk
# include $(DEPLOY_BOILERPLATE_FSPATH)/fly.mk
# include $(DEPLOY_BOILERPLATE_FSPATH)/gor.mk
# include $(DEPLOY_BOILERPLATE_FSPATH)/jb.mk


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
FRONTEND_HOST = "withered-morning-8272.fly.dev"
FRONTEND_PORT = 443
FRONTEND_URL_WEB = "withered-morning-8272.fly.dev"
FRONTEND_URL_NATIVE = "withered-morning-8272.fly.dev"

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

dep-os:
	# Install go-bindata, jsonnet-bundler, go-jsonnet here
	if [ $(uname_s) = Linux ]; then \
		curl -L -o /tmp/jb https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v$(JB_VERSION)/jb-$(uname_s)-amd64 && \
			chmod +x /tmp/jb && sudo install -Dm755 /tmp/jb /usr/local/bin/jb && \
		curl -L https://github.com/google/go-jsonnet/releases/download/v$(GO_JSONNET_VERSION)/go-jsonnet_$(GO_JSONNET_VERSION)_$(uname_s)_$(uname_m).tar.gz | tar xvz -C /tmp && \
			sudo install -Dm755 /tmp/jsonnet /usr/local/bin/jsonnet; \
	elif [$(uname_s) = Darwin]; then \
		brew install jb \
		brew install go-jsonnet; \
	fi
	curl -L https://github.com/go-bindata/go-bindata/archive/v$(GO_BINDATA_VERSION).tar.gz | tar xvz -C /tmp && \
		cd /tmp/go-bindata-$(GO_BINDATA_VERSION)/go-bindata && go build && sudo install -Dm755 go-bindata /usr/local/bin/go-bindata
	git clone https://github.com/FiloSottile/mkcert /tmp/mkcert && cd /tmp/mkcert && \
		go build -ldflags "-X main.Version=$(git describe --tags)" && sudo install -Dm755 mkcert /usr/local/bin/mkcert
	git clone https://github.com/getcouragenow/shared /tmp/shared && \
		cd /tmp/shared/tool/bs-lang && go build && sudo install -Dm755 bs-lang /usr/local/bin/bs-lang
	# TODO
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
	mkdir -p $(BIN_DIR) $(VERSION_DIR) $(CONFIG_DIR) $(FRONTEND_ABS_PREFIX)
	@go mod vendor

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
	cp -Rv $(VENDOR_DIR)/$(TEMPLATE_DIR)/certs $(PWD)/certs
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && \
		$(MAKE) VERSION_OUTPUT_DIR=$(VERSION_DIR) this-version-gen
	go-bindata -fs -nomemcopy -o $(EMBED_OUTPUT_DIR)/assets.go -prefix "$(FRONTEND_WEB_PREFIX)" $(PWD)/flutter/build/web/...
	go-bindata -pkg version -fs -nomemcopy -o $(VERSION_OUTPUT_DIR) -prefix "version/" $(VERSION_DIR)/manifest.json
	$(GO_LDFLAGS) -o $(SERVER_BIN) $(SERVER_ENTRYPOINT)

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

