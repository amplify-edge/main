# boot repo makefiles
# docker cannot include directory outside of its context
# BOILERPLATE_FSPATH=./../../../../boot/boilerplate
# include $(BOILERPLATE_FSPATH)/help.mk
# include $(BOILERPLATE_FSPATH)/os.mk
# include $(BOILERPLATE_FSPATH)/gitr.mk

# main repo make files ( will later be in boot) and fly and hug mapped to tools.mk.
# also use the dwn.mk for ALL the other tools we need, so we dont need gopaths and that slowness.
# DEPLOY_BOILERPLATE_FSPATH=./../..
 DEPLOY_BOILERPLATE_FSPATH=includes
 include $(DEPLOY_BOILERPLATE_FSPATH)/dwn.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/hug.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/hcl.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/fly.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/go-bindata.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/go-bindata-assetfs.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/gor.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/jsonnet.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/jsonnetb.mk
 include $(DEPLOY_BOILERPLATE_FSPATH)/mkcert.mk

CONFIG_DIR = $(PWD)/config
ENCRYPTED_CONFIG_DIR = $(PWD)/encrypted-config

VENDOR_DIR = jb-build
VERSION_DIR = $(PWD)/version
BIN_DIR = $(PWD)/bin-all
CLI_BIN = $(BIN_DIR)/maintemplatev2-cli
SERVER_BIN = $(BIN_DIR)/maintemplatev2
SERVER_BIN_DEPLOY = $(BIN_DIR)/maintemplatev2-deploy
TEMPLATE_DIR = github.com/getcouragenow/main/deploy/templates/maintemplatev2

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

IMAGE_BASE := alpine:3.12
IMAGE_NAME = $(FLY_APP_NAME)
IMAGE_AUTHOR = $(shell basename $(dir $(shell git rev-parse --show-toplevel)))
IMAGE_DATE = $(shell date -u +%Y%m%d%H%M%S)
IMAGE_PORT = $(FLY_APP_PORT)
IMAGE_ORG = $(FLY_APP_ORG)
IMAGE_EXECUTABLE = maintemplatev2-deploy
IMAGE_REF = $(shell git rev-parse HEAD)
IMAGE_FLAGS = ""

FRONTEND_PREFIX = flutter/build/
FRONTEND_WEB_PREFIX = $(FRONTEND_PREFIX)web/
FRONTEND_ABS_PREFIX = $(PWD)/$(FRONTEND_WEB_PREFIX)
FRONTEND_HOST = "org-y.fly.dev"
FRONTEND_PORT = 443
FRONTEND_URL_WEB = "org-y.fly.dev"
FRONTEND_URL_NATIVE = "org-y.fly.dev"

MAIN_TLS_ENABLE = true
MAIN_TLS_LOCAL = true
MAIN_DOMAIN = $(FRONTEND_URL_WEB)
MAIN_HOST = $(FRONTEND_HOST)
MAIN_PORT = $(FRONTEND_PORT)
MAIN_IS_LOCAL = true
MAIN_EMBED_DIR = $(FRONTEND_ABS_PREFIX)

EMBED_OUTPUT_DIR = $(PWD)/cmd/server/

CONFIG_PASSWORD:=$(shell echo "$$CONFIG_PASSWORD")

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
	@echo "Please set CONFIG_PASSWORD environment variable if it's empty via your shell"
	@echo CONFIG_PASSWORD: $(shell echo "$$CONFIG_PASSWORD")
	@echo

dep-os: dep-os-delete
	@$(MAKE) jsonnet-dep
	@$(MAKE) jsonnetb-dep
	@$(MAKE) gb-dep
	@$(MAKE) fly-dep
	@$(MAKE) hug-dep
	@$(MAKE) gor-dep
	@$(MAKE) mkcert-dep
	@$(MAKE) dep-os-internal

dep-os-internal:
	@jb --jsonnetpkg-home=$(VENDOR_DIR) install && jb --jsonnetpkg-home=$(VENDOR_DIR) update # driven by jsonnet
	cd $(VENDOR_DIR)/github.com/getcouragenow/shared/tool/bs-lang && go build && sudo install -m755 bs-lang $(PREFIX)/bs-lang
	cd $(VENDOR_DIR)/github.com/getcouragenow/ops/bs-crypt && go build && sudo install -m755 bs-crypt $(PREFIX)/bs-crypt

dep-os-delete:
	@$(MAKE) hug-dep-delete
	@$(MAKE) fly-dep-delete
	@$(MAKE) gor-dep-delete
	@$(MAKE) jsonnet-dep-delete
	@$(MAKE) jsonnetb-dep-delete
	@$(MAKE) gb-dep-delete
	@$(MAKE) mkcert-dep-delete
	sudo rm -rf $(PREFIX)/bs-{lang,crypt}
	rm -rf downloaded

all: dep-delete dep-os dep gen build

dep: dep-os
	# Create dirs for binaries
	mkdir -p $(BIN_DIR) $(VERSION_DIR) $(CONFIG_DIR) $(FRONTEND_PREFIX)
#	@go mod vendor

dep-delete:
	rm -rf $(VENDOR_DIR) $(BIN_DIR) $(VERSION_DIR) $(PWD)/certs $(FRONTEND_ABS_PREFIX)

gen:
	@cd $(VENDOR_DIR)/$(TEMPLATE_DIR)/client && flutter pub get && flutter pub upgrade
	@cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && \
		$(MAKE) \
			MAIN_TLS_ENABLE=$(MAIN_TLS_ENABLE) \
			MAIN_TLS_LOCAL=$(MAIN_TLS_LOCAL) \
			MAIN_DOMAIN=$(MAIN_DOMAIN) \
			MAIN_HOST=$(MAIN_HOST) \
			MAIN_PORT=$(MAIN_PORT) \
			MAIN_IS_LOCAL=$(MAIN_IS_LOCAL) \
			MAIN_EMBED_DIR=$(MAIN_EMBED_DIR) this-gen
	@cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && \
		$(MAKE) FRONTEND_HOST=$(FRONTEND_HOST) \
			FRONTEND_PORT=$(FRONTEND_PORT) \
			FRONTEND_URL_WEB=$(FRONTEND_URL_WEB) \
			FRONTEND_URL_NATIVE=$(FRONTEND_URL_NATIVE) this-flutter-gen
	$(MAKE) config

# build recipe
build: # dep
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && $(MAKE) flu-web-build
	mkdir -p $(FRONTEND_ABS_PREFIX)
	cp -Rv $(VENDOR_DIR)/$(TEMPLATE_DIR)/client/build/web/* $(FRONTEND_ABS_PREFIX)
	cd $(VENDOR_DIR)/$(TEMPLATE_DIR) && \
		$(MAKE) VERSION_OUTPUT_DIR=$(VERSION_DIR) this-version-gen
	go-bindata -fs -nomemcopy -o $(EMBED_OUTPUT_DIR)/assets.go -prefix "$(FRONTEND_WEB_PREFIX)" $(PWD)/flutter/build/web/...
	go-bindata -fs -nomemcopy -pkg version -o $(VERSION_DIR)/version.go -prefix "version/" $(VERSION_DIR)/manifest.json
	$(GO_LDFLAGS) -o $(SERVER_BIN) $(SERVER_ENTRYPOINT)
	GOOS=linux GOARCH=amd64 $(GO_LDFLAGS) -o $(SERVER_BIN_DEPLOY) $(SERVER_ENTRYPOINT)

config: config-del
	bs-crypt encrypt -s $(CONFIG_DIR) -d $(ENCRYPTED_CONFIG_DIR)

config-del:
	rm -rf $(ENCRYPTED_CONFIG_DIR)

# docker recipe for local testing
docker:
	docker build . -t "${FLY_APP_NAME}:${IMAGE_REF}" \
		--build-arg IMAGE_REF=$(IMAGE_REF) \
		--build-arg IMAGE_BASE=$(IMAGE_BASE) \
		--build-arg IMAGE_DATE=$(IMAGE_DATE) \
		--build-arg IMAGE_EXECUTABLE=$(IMAGE_EXECUTABLE) \
		--build-arg IMAGE_PORT=$(IMAGE_PORT) \
		--build-arg IMAGE_AUTHOR=$(IMAGE_AUTHOR) \
		--build-arg IMAGE_ORG=$(IMAGE_ORG) \
		--build-arg IMAGE_FLAGS=$(IMAGE_FLAGS) \
		--build-arg IMAGE_NAME=$(IMAGE_NAME) \
		--build-arg CONFIG_PASSWORD=$(CONFIG_PASSWORD)
	docker system prune --volumes -f

fly:
	flyctl deploy \
			--build-arg IMAGE_REF=$(IMAGE_REF) \
        	--build-arg IMAGE_BASE=$(IMAGE_BASE) \
        	--build-arg IMAGE_DATE=$(IMAGE_DATE) \
        	--build-arg IMAGE_EXECUTABLE=$(IMAGE_EXECUTABLE) \
        	--build-arg IMAGE_PORT=$(IMAGE_PORT) \
        	--build-arg IMAGE_AUTHOR=$(IMAGE_AUTHOR) \
        	--build-arg IMAGE_ORG=$(IMAGE_ORG) \
        	--build-arg IMAGE_FLAGS=$(IMAGE_FLAGS) \
        	--build-arg CONFIG_PASSWORD=$(CONFIG_PASSWORD) \
        	--build-arg IMAGE_NAME=$(IMAGE_NAME)

fly-create:
	flyctl init --dockerfile --name org-y --org getcouragenow-org --port 8080 --overwrite
#	flyctl scale vm shared-cpu-1x --memory=1024 # 1GB
	flyctl volumes create db --region ams --app $(FLY_APP_NAME)
	flyctl secrets --app $(FLY_APP_NAME) set CONFIG_PASSWORD=$(CONFIG_PASSWORD) && \
	cp fly.toml.bak fly.toml

