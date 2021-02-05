SHELL := bash
.PHONY: config-gen config-dep gen cert-gen config-encrypt

SHARED_FSPATH=./../../../../shared
DEP_FSPATH=./../../
BOILERPLATE_FSPATH=$(SHARED_FSPATH)/boilerplate

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/gitr.mk
include $(BOILERPLATE_FSPATH)/go.mk
include $(BOILERPLATE_FSPATH)/flu.mk
include $(BOILERPLATE_FSPATH)/tool.mk

## DEPENDENCY PATH
include $(DEP_FSPATH)/dwn.mk
include $(DEP_FSPATH)/go-bindata.mk
include $(DEP_FSPATH)/jsonnet.mk
include $(DEP_FSPATH)/jsonnetb.mk
include $(DEP_FSPATH)/mkcert.mk

FLU_LIB_NAME = client
FLU_SAMPLE_NAME = client
FLU_SAMPLE_FSPATH = $(PWD)/$(FLU_SAMPLE_NAME)

BIN_DIR=bin-all
SDK_BIN=$(BIN_DIR)/maintemplatev2-sdk-cli
SERVER_BIN=$(BIN_DIR)/maintemplatev2
# TODO. Make config.
SERVER_ADDRESS=127.0.0.1:8080

EMAIL = superadmin@amplify-cms.org
PASSWORD = superadmin

CONFIG_OUTPUT_DIR = $(PWD)/plain-config
DB_ENCRYPT_KEY = yYz8Xjb4HBn4irGQpBWulURjQk2XmwES

EMAIL = gutterbacon@protonmail.com
PASSWORD = test1235
SUPER_EMAIL = superadmin@amplify-cms.org
SUPER_PASSWORD = superadmin
NEW_SUPER_EMAIL = gutterbacon@amplify-cms.org
NEW_SUPER_PASSWORD = SmokeOnTheWater70s
SYS_ACCOUNT_DB_ENCRYPT_KEY   = yYz8Xjb4HBn4irGQpBWulURjQk2XmwES
SYS_ACCOUNT_SENDGRID_API_KEY = SOME_SENDGRID_API_KEY
SYS_ACCOUNT_FILEDB_ENCRYPT_KEY   = A9bhbid5ODrKQVvd9MY17P5MZ
MOD_DISCO_DB_ENCRYPT_KEY = ZSXV8lTrfPeSuysDVm

CERT_DIR = ./certs
CERT_SERVER_NAME ?= $(CERT_DIR)/local.pem
CERT_SERVER_KEY ?= $(CERT_DIR)/local.key.pem
CA_ROOT_NAME ?= $(CERT_DIR)/rootca.pem
MKCERT_CA_ROOT_DIR = $(shell mkcert -CAROOT)

ACCOUNT_ID = ???
VERIFY_TOKEN = ???
ORG_ID  = ???
PROJECT_ID = ???

FRONTEND_BUILD_DIR = client/build/web/
FRONTEND_PREFIX = client/build/web/
FRONTEND_ABS_PREFIX = $(PWD)/client/build/web/
VERSION_OUTPUT_DIR = version
VERSION_PREFIX = $(VERSION_OUTPUT_DIR)/
EMBED_OUTPUT_DIR = main/server/
SERVER_ENTRYPOINT = main/server/*
CLI_ENTRYPOINT = main/sdk-cli/*

FRONTEND_RELEASE_CHANNEL = dev
FRONTEND_URL_WEB = amplifyedge.org
FRONTEND_URL_NATIVE = amplifyedge.org
FRONTEND_GITHASH = $(shell git rev-parse HEAD)
FRONTEND_FLUTTER_CHANNEL = $(shell flutter --version | awk '/channel/ {print $$5}')
FRONTEND_HOST = 127.0.0.1
FRONTEND_PORT = 8080

MAIN_TLS_ENABLE = true
MAIN_TLS_LOCAL = true
MAIN_DOMAIN = $(FRONTEND_URL_WEB)
MAIN_HOST = $(FRONTEND_HOST)
MAIN_PORT = $(FRONTEND_PORT)
MAIN_IS_LOCAL = true
MAIN_EMBED_DIR = $(FRONTEND_ABS_PREFIX)

VENDOR_DIR := $(PWD)/vendor
BUILD_FRONTEND_VERSION = $(FRONTEND_GITHASH)
BUILD_SERVER_VERSION = $(shell git rev-parse HEAD)
BUILD_CLI_VERSION = $(BUILD_SERVER_VERSION)
BUILD_USER = $(shell basename $(dir $(shell git rev-parse --show-toplevel)))
BUILD_DATE = $(shell date -u +%Y%m%d%H%M%S)
BUILD_GO_VERSION = $(shell go version | awk '{print $$3}')
BUILD_GITBRANCH = $(shell git symbolic-ref --short HEAD)
BUILD_FLUTTER_VERSION = $(shell flutter --version | awk '/channel/ {print $$2}')

GO_LDFLAGS = CGO_ENABLED=0 go build -ldflags "-X main.build=${VERSION_GITHASH}" -a -tags netgo

export BS_CRYPT_PASSWORD = $(shell echo "$${CONFIG_PASSWORD}")
export CONFIG_PASSWORD = $(shell echo "$${CONFIG_PASSWORD}")

all: dep-os gen build

clean: dep-os-delete gen-delete build-delete
	rm -rf $(CERT_DIR) db encrypted-config runtime-config $(VENDOR_DIR) $(VERSION_OUTPUT_DIR)

## Print all settings
print: ## print
	$(MAKE) os-print
	$(MAKE) flu-print
	$(MAKE) flu-gen-lang-print
	$(MAKE) go-print
	@echo FRONTEND_RELEASE_CHANNEL: $(FRONTEND_RELEASE_CHANNEL)
	@echo FRONTEND_URL_WEB: $(FRONTEND_URL_WEB)
	@echo FRONTEND_URL_NATIVE: $(FRONTEND_URL_NATIVE)
	@echo FRONTEND_GITHASH: $(FRONTEND_GITHASH)
	@echo FRONTEND_FLUTTER_CHANNEL: $(FRONTEND_FLUTTER_CHANNEL)

dep-os:
	@$(MAKE) jsonnet-dep
	@$(MAKE) jsonnetb-dep
	@$(MAKE) gbd-dep
	@$(MAKE) mkcert-dep


dep-os-delete:
	@$(MAKE) jsonnet-dep-delete
	@$(MAKE) jsonnetb-dep-delete
	@$(MAKE) gbd-dep-delete
	@$(MAKE) mkcert-dep-delete

build-delete:
	rm -rf $(SDK_BIN) $(SERVER_BIN)
	rm -rf $(EMBED_DIR)

embed:
	go-bindata -fs -nomemcopy -o $(EMBED_OUTPUT_DIR)/assets.go -prefix "$(FRONTEND_PREFIX)" $(FRONTEND_ABS_PREFIX)...
	go-bindata -pkg version -fs -nomemcopy -o $(VERSION_OUTPUT_DIR)/version.go -prefix "$(VERSION_PREFIX)" $(VERSION_OUTPUT_DIR)/manifest.json

build: build-delete version-gen
	## Flutter first
	$(MAKE) flutter-gen
	$(MAKE) flu-web-build
	$(MAKE) embed
	$(GO_LDFLAGS) -o $(SDK_BIN) $(CLI_ENTRYPOINT)
	$(GO_LDFLAGS) -o $(SERVER_BIN) $(SERVER_ENTRYPOINT)

gen: gen-delete
	$(MAKE) config-gen
	cd $(VENDOR_DIR)/github.com/amplify-cms/shared/tool/bs-lang && go build && sudo install -m755 bs-lang $(PREFIX)/bs-lang
	cd $(VENDOR_DIR)/github.com/amplify-cms/shared/tool/bs-crypt && go build && sudo install -m755 bs-crypt $(PREFIX)/bs-crypt
	$(MAKE) cert-gen
	#$(MAKE) flu-gen-lang-all
	cd client && flutter pub get && flutter pub upgrade
	$(MAKE) gen-icons
	$(MAKE) flutter-gen
	$(MAKE) version-gen
	$(MAKE) config-encrypt
	
gen-delete:
	# Refactor into config.mk
	# config
	rm -rf $(CONFIG_OUTPUT_DIR)/*
	rm -rf certs
	# maybe the lang and grpc stuff.

#config-delete:
#	rm -rf $(CONFIG_OUTPUT_DIR)/*

config-gen: #config-dep
	mkdir -p $(CONFIG_OUTPUT_DIR)
	@echo Generating Config
	# OVERRIDES IF you need them
	jsonnet -S config-server.jsonnet \
		-V SYS_ACCOUNT_DB_ENCRYPT_KEY=$(SYS_ACCOUNT_DB_ENCRYPT_KEY) \
		-V SYS_ACCOUNT_FILEDB_ENCRYPT_KEY=$(SYS_ACCOUNT_FILEDB_ENCRYPT_KEY) \
		-V SYS_ACCOUNT_SENDGRID_API_KEY=$(SYS_ACCOUNT_SENDGRID_API_KEY) \
		-V MAIN_TLS_ENABLE=$(MAIN_TLS_ENABLE) \
		-V MAIN_TLS_LOCAL=$(MAIN_TLS_LOCAL) \
		-V MAIN_DOMAIN=$(MAIN_DOMAIN) \
		-V MAIN_HOST=$(MAIN_HOST) \
		-V MAIN_PORT=$(MAIN_PORT) \
		-V MAIN_IS_LOCAL=$(MAIN_IS_LOCAL) \
		-V MAIN_EMBED_DIR=$(MAIN_EMBED_DIR) > $(CONFIG_OUTPUT_DIR)/config-server.yml
	jsonnet -S config-client.jsonnet \
		-V MAIN_TLS_ENABLE=$(MAIN_TLS_ENABLE) \
		-V MAIN_TLS_LOCAL=$(MAIN_TLS_LOCAL) \
		-V MAIN_DOMAIN=$(MAIN_DOMAIN) \
		-V MAIN_HOST=$(MAIN_HOST) \
		-V MAIN_PORT=$(MAIN_PORT) \
		-V MAIN_IS_LOCAL=$(MAIN_IS_LOCAL) \
		-V MAIN_EMBED_DIR=$(MAIN_EMBED_DIR) > $(CONFIG_OUTPUT_DIR)/config-client.yml

flutter-gen:
	jsonnet -S flutter-client.jsonnet \
		-V FRONTEND_HOST=$(FRONTEND_HOST) \
		-V FRONTEND_PORT=$(FRONTEND_PORT) \
 		-V FRONTEND_RELEASE_CHANNEL=$(FRONTEND_RELEASE_CHANNEL) \
 		-V FRONTEND_URL_WEB=$(FRONTEND_URL_WEB) \
 		-V FRONTEND_URL_NATIVE=$(FRONTEND_URL_NATIVE) \
 		-V FRONTEND_GITHASH=$(FRONTEND_GITHASH) \
 		-V FRONTEND_FLUTTER_CHANNEL=$(FRONTEND_FLUTTER_CHANNEL) > $(FLU_LIB_NAME)/assets/env.json

config-dep:
	jb install && jb update
	cd vendor/github.com/amplify-cms/sys/sys-account/service/go && jb install && jb update
	cd vendor/github.com/amplify-cms/mod/mod-disco/service/go && jb install && jb update

version-gen:
	mkdir -p $(VERSION_OUTPUT_DIR)
	jsonnet -S build_info.jsonnet -V BUILD_FRONTEND_VERSION=$(BUILD_FRONTEND_VERSION) \
		-V BUILD_SERVER_VERSION=$(BUILD_SERVER_VERSION) \
		-V BUILD_CLI_VERSION=$(BUILD_CLI_VERSION) \
		-V BUILD_GO_VERSION=$(BUILD_GO_VERSION) \
		-V BUILD_FLUTTER_VERSION=$(BUILD_FLUTTER_VERSION) \
		-V BUILD_GITBRANCH=$(BUILD_GITBRANCH) \
		-V BUILD_USER=$(BUILD_USER) \
		-V BUILD_DATE=$(BUILD_DATE) > $(VERSION_OUTPUT_DIR)/manifest.json

cert-gen: cert-gen-delete
	@mkdir -p $(CERT_DIR)
	@mkcert -cert-file certs/local.pem -key-file certs/local.key.pem localhost 127.0.0.1 ::1
	@cp $(MKCERT_CA_ROOT_DIR)/rootCA.pem $(CA_ROOT_NAME)
	mkcert -install

cert-gen-delete:
	rm -rf $(CERT_DIR)/*.{pem,key,csr,crt}

config-encrypt:
	bs-crypt encrypt -s $(CONFIG_OUTPUT_DIR) -d encrypted-config


build-deep:
	# DO bottom up so we get the embeddings i think.
	# finally build the top :)
	$(MAKE) build

### RUN for CI

run-server:
	# TODO: fork to run in background
	mkdir -p db
	$(SERVER_BIN) -c ./runtime-config
	# TODO then call the sdk targets sequentially.
	
run-kill:
	# Works on mac
	pkill -f $(SERVER_BIN)

run-client:
	$(MAKE) sdk-auth-signup
	$(MAKE) sdk-auth-signin

