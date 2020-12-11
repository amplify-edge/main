
SHARED_FSPATH=./../../../../shared
BOILERPLATE_FSPATH=$(SHARED_FSPATH)/boilerplate

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/gitr.mk
include $(BOILERPLATE_FSPATH)/go.mk
include $(BOILERPLATE_FSPATH)/flu.mk
include $(BOILERPLATE_FSPATH)/tool.mk

# KEY_PATH = ???

FLU_LIB_NAME = client
FLU_SAMPLE_NAME = client
FLU_SAMPLE_FSPATH = $(PWD)/$(FLU_SAMPLE_NAME)

BIN_DIR=bin-all
SDK_BIN=$(BIN_DIR)/maintemplatev2-sdk-cli
SERVER_BIN=$(BIN_DIR)/maintemplatev2
# TODO. Make config.
SERVER_ADDRESS=127.0.0.1:9074

EMAIL = superadmin@getcouragenow.org
PASSWORD = superadmin

CONFIG_OUTPUT_DIR = $(PWD)/config
DB_ENCRYPT_KEY = yYz8Xjb4HBn4irGQpBWulURjQk2XmwES

EMAIL = gutterbacon@protonmail.com
PASSWORD = test1235
SUPER_EMAIL = superadmin@getcouragenow.org
SUPER_PASSWORD = superadmin
NEW_SUPER_EMAIL = gutterbacon@getcouragenow.org
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

FRONTEND_RELEASE_CHANNEL = dev
FRONTEND_URL_WEB = getcourage.org
FRONTEND_URL_NATIVE = getcourage.org
FRONTEND_GITHASH = $(shell git rev-parse HEAD)
FRONTEND_FLUTTER_CHANNEL = $(shell flutter --version | awk '/channel/ {print $$5}')

BUILD_FRONTEND_VERSION = $(FRONTEND_GITHASH)
BUILD_SERVER_VERSION = $(shell git rev-parse HEAD)
BUILD_CLI_VERSION = $(BUILD_SERVER_VERSION)
BUILD_USER = $(shell basename $(dir $(shell git rev-parse --show-toplevel)))
BUILD_DATE = $(shell date -u +%Y%m%d%H%M%S)
BUILD_GO_VERSION = $(shell go version | awk '{print $$3}')
BUILD_GITBRANCH = $(shell git symbolic-ref --short HEAD)
BUILD_FLUTTER_VERSION = $(shell flutter --version | awk '/channel/ {print $$2}')

GO_LDFLAGS = CGO_ENABLED=0 go build -ldflags "-X main.build=${VERSION_GITHASH}" -a -tags netgo
FRONTEND_BUILD_DIR = client/build/web/
FRONTEND_PREFIX = client/build/web/
FRONTEND_ABS_PREFIX = $(PWD)/client/build/web/
VERSION_OUTPUT_DIR = version
VERSION_PREFIX = $(VERSION_OUTPUT_DIR)/
EMBED_OUTPUT_DIR = main/server/
SERVER_ENTRYPOINT = main/server/*
CLI_ENTRYPOINT = main/sdk-cli/*


this-all: this-gen this-build this-run-server this-run-client

## Print all settings
this-print: ## print
	$(MAKE) os-print
	$(MAKE) flu-print
	$(MAKE) flu-gen-lang-print
	$(MAKE) go-print
	@echo FRONTEND_RELEASE_CHANNEL: $(FRONTEND_RELEASE_CHANNEL)
	@echo FRONTEND_URL_WEB: $(FRONTEND_URL_WEB)
	@echo FRONTEND_URL_NATIVE: $(FRONTEND_URL_NATIVE)
	@echo FRONTEND_GITHASH: $(FRONTEND_GITHASH)
	@echo FRONTEND_FLUTTER_CHANNEL: $(FRONTEND_FLUTTER_CHANNEL)

this-build-delete:
	rm -rf $(SDK_BIN) $(SERVER_BIN)
	rm -rf ./assets

this-embed:
	go-bindata -fs -nomemcopy -o $(EMBED_OUTPUT_DIR)/assets.go -prefix "$(FRONTEND_PREFIX)" $(FRONTEND_ABS_PREFIX)...
	go-bindata -pkg version -fs -nomemcopy -o $(VERSION_OUTPUT_DIR)/version.go -prefix "$(VERSION_PREFIX)" $(VERSION_OUTPUT_DIR)/manifest.json


this-build: this-build-delete this-version-gen
	## Flutter first
	$(MAKE) flu-web-build
#	cp -Rv $(FRONTEND_BUILD_DIR) $(FRONTEND_ABS_PREFIX)
	$(MAKE) this-embed
	$(GO_LDFLAGS) -o $(SDK_BIN) $(CLI_ENTRYPOINT)
	$(GO_LDFLAGS) -o $(SERVER_BIN) $(SERVER_ENTRYPOINT)


this-gen: this-gen-delete
	$(MAKE) this-config-dep
	$(MAKE) this-config-gen
	$(MAKE) this-cert-dep
	$(MAKE) this-cert-gen
	$(MAKE) gen-icons
	$(MAKE) gen-hive
	$(MAKE) flu-gen-lang-all
	
this-gen-delete:
	# Refactor into config.mk

	# config
	rm -rf $(CONFIG_OUTPUT_DIR)/*
	# maybe the lang and grpc stuff.

#this-config-delete:
#	rm -rf $(CONFIG_OUTPUT_DIR)/*

this-config-gen: this-config-dep
	mkdir -p $(CONFIG_OUTPUT_DIR)
	@echo Generating Config
	# OVERRIDES IF you need them
	jsonnet -S sysaccount.jsonnet \
		-V SYS_ACCOUNT_DB_ENCRYPT_KEY=$(SYS_ACCOUNT_DB_ENCRYPT_KEY) \
		-V SYS_ACCOUNT_FILEDB_ENCRYPT_KEY=$(SYS_ACCOUNT_FILEDB_ENCRYPT_KEY) \
		-V SYS_ACCOUNT_SENDGRID_API_KEY=$(SYS_ACCOUNT_SENDGRID_API_KEY)> $(CONFIG_OUTPUT_DIR)/sysaccount.yml
	jsonnet -S moddisco.jsonnet -V MOD_DISCO_DB_ENCRYPT_KEY=$(MOD_DISCO_DB_ENCRYPT_KEY) > $(CONFIG_OUTPUT_DIR)/moddisco.yml
	jsonnet -S bootstrap-server.jsonnet \
 		-V BOOTSTRAP_DOMAIN=$(FRONTEND_URL_WEB) > $(CONFIG_OUTPUT_DIR)/bootstrap-server.yml
	jsonnet -S bootstrap-client.jsonnet \
 		-V BOOTSTRAP_DOMAIN=$(FRONTEND_URL_WEB) > $(CONFIG_OUTPUT_DIR)/bootstrap-client.yml
	jsonnet -S main.jsonnet > $(CONFIG_OUTPUT_DIR)/main.yml
	jsonnet -S flutter-client.jsonnet \
 		-V FRONTEND_RELEASE_CHANNEL=$(FRONTEND_RELEASE_CHANNEL) \
 		-V FRONTEND_URL_WEB=$(FRONTEND_URL_WEB) \
 		-V FRONTEND_URL_NATIVE=$(FRONTEND_URL_NATIVE) \
 		-V FRONTEND_GITHASH=$(FRONTEND_GITHASH) \
 		-V FRONTEND_FLUTTER_CHANNEL=$(FRONTEND_FLUTTER_CHANNEL) > $(FLU_LIB_NAME)/assets/env.json

this-config-dep:
	go get -u -v github.com/go-bindata/go-bindata/...
	jb install && jb update
	cd vendor/github.com/getcouragenow/sys/sys-account/service/go && jb install && jb update
	#cd vendor/github.com/getcouragenow/sys/sys-core/service/go && jb install && jb update
	cd vendor/github.com/getcouragenow/mod/mod-disco/service/go && jb install && jb update

this-version-gen:
	mkdir -p $(VERSION_OUTPUT_DIR)
	jsonnet -S build_info.jsonnet -V BUILD_FRONTEND_VERSION=$(BUILD_FRONTEND_VERSION) \
		-V BUILD_SERVER_VERSION=$(BUILD_SERVER_VERSION) \
		-V BUILD_CLI_VERSION=$(BUILD_CLI_VERSION) \
		-V BUILD_GO_VERSION=$(BUILD_GO_VERSION) \
		-V BUILD_FLUTTER_VERSION=$(BUILD_FLUTTER_VERSION) \
		-V BUILD_GITBRANCH=$(BUILD_GITBRANCH) \
		-V BUILD_USER=$(BUILD_USER) \
		-V BUILD_DATE=$(BUILD_DATE) > $(VERSION_OUTPUT_DIR)/manifest.json

this-cert-gen: this-cert-gen-delete
	@mkdir -p $(CERT_DIR)
	@mkcert -cert-file certs/local.pem -key-file certs/local.key.pem localhost 127.0.0.1 ::1
	@cp $(MKCERT_CA_ROOT_DIR)/rootCA.pem $(CA_ROOT_NAME)
	mkcert -install

this-cert-gen-delete:
	#mkcert -uninstall
	rm -rf $(CERT_DIR)/*.{pem,key,csr,crt}

this-cert-dep:
	#brew install mkcert nss


this-build-deep:
	# DO bottom up so we get the embeddings i think.
	#cd ../sys-core && make this-build

	#cd ../mod-main && make this-build
	
	# finally build the top :)
	$(MAKE) this-build

### RUN for CI

this-run-server:
	# TODO: fork to run in background
	$(MAKE) this-server-run

	# TODO then call the sdk targets sequentially.
	
this-run-kill:
	# Works on mac
	pkill -f $(SERVER_BIN)

this-run-client:
	$(MAKE) this-sdk-auth-signup
	$(MAKE) this-sdk-auth-signin


### For Dev

this-sdk-run:
	$(SDK_BIN)

this-server-run: this-server-run-clean
	mkdir -p db
	$(SERVER_BIN) -a ./config/sysaccount.yml

this-server-run-clean:
	rm -rf db

this-server-open:
	open http://$(SERVER_ADDRESS)

this-sdk-auth-signup:
	@echo Running Example Register Client
	$(SDK_BIN) sys-account auth-service register --email $(EMAIL) --password $(PASSWORD) --password-confirm $(PASSWORD)

this-sdk-auth-signin:
	@echo Running Example Login Client
	$(SDK_BIN) sys-account auth-service signin --email $(EMAIL) --password $(PASSWORD) --server-addr $(SERVER_ADDRESS)

this-sdk-auth-signin-super:
	@echo Running Example Login Client
	# export access token to the .token file
	$(SDK_BIN) sys-account auth-service signin --email $(SUPER_EMAIL) --password $(SUPER_PASSWORD)

this-sdk-auth-verify:
	@echo Running Example Verify Client
	$(SDK_BIN) sys-account auth-service verify-account --account-id $(ACCOUNT_ID) --verify-token $(VERIFY_TOKEN)

this-sdk-accounts-new:
	@echo Running Example New Account
	$(SDK_BIN) sys-account account-service new-account -s $(SERVER_ADDRESS) --email gutterbacon@example.com --password gutterbacon123 --avatar-filepath ./testdata/avatar.png

this-sdk-accounts-list:
	@echo Running Example Accounts List
	$(SDK_BIN) sys-account account-service list-accounts

this-sdk-accounts-get:
	@echo Running Example Accounts Get
	$(SDK_BIN) sys-account account-service get-account --id $(ACCOUNT_ID)

this-sdk-accounts-update:
	@echo Running Example Accounts Update
	$(SDK_BIN) sys-account account-service update-account --id $(ACCOUNT_ID)  --disabled

this-sdk-accounts-assign-super:
	@echo Assigning Account to Superuser
	$(SDK_BIN) sys-account account-service assign-account-to-role --assigned-account-id $(ACCOUNT_ID) --role-all --role-role 4

this-sdk-org-new:
	@echo Running Example Create Org
	$(SDK_BIN) sys-account org-proj-service new-org --name "ORG 1" --logo-filepath "./testdata/avatar.png"

this-sdk-org-get:
	@echo Running Example Get Org
	$(SDK_BIN) sys-account org-proj-service get-org --id $(ORG_ID)

this-sdk-org-list:
	@echo Running Example List Org
	$(SDK_BIN) sys-account org-proj-service list-org

this-sdk-org-update:
	@echo Running Example Update Org
	$(SDK_BIN) sys-account org-proj-service update-org --id $(ORG_ID) --name "ORG 2" --contact "contact@getcouragenow.org"

this-sdk-project-new:
	@echo Running Example Create New Project
	$(SDK_BIN) sys-account org-proj-service new-project --org-id $(ORG_ID) --name PROJECT1 --logo-filepath "./testdata/avatar.png"

this-sdk-project-list:
	@echo Running Example List Project
	$(SDK_BIN) sys-account org-proj-service list-project

this-sdk-project-get:
	@echo Running Example Get Project
	$(SDK_BIN) sys-account org-proj-service get-project --id $(PROJECT_ID)

this-sdk-bench: this-sdk-bench-start this-sdk-bench-01 this-sdk-bench-02
	@echo -- Example SDK Benchmark: End --

this-sdk-bench-start:
	@echo -- Example SDK Benchmark: Start --

	@echo Running Example SDK Benchmark, Run server first!

this-sdk-bench-01:
	# Small
	@echo USERS: 10
	@echo DB CONNECTIONS: 1
	$(SDK_BIN) sys-bench -e -t $(CA_ROOT_NAME) -s $(SERVER_ADDRESS) -j "./bench/fake-register-data.json" -p "../sys-share/sys-account/proto/v2/sys_account_services.proto" -n "v2.sys_account.services.AuthService.Register" -r 10 -c 1


this-sdk-bench-02:
	# Medium
	@echo USERS: 100
	@echo DB CONNECTIONS: 10
	$(SDK_BIN) sys-bench -e -t $(CA_ROOT_NAME) -s $(SERVER_ADDRESS) -j "./bench/fake-register-data.json" -p "../sys-share/sys-account/proto/v2/sys_account_services.proto" -n "v2.sys_account.services.AuthService.Register" -r 100 -c 10

this-sdk-bench-03:
	# Medium
	@echo USERS: 1000
	@echo DB CONNECTIONS: 100
	$(SDK_BIN) sys-bench -e -t $(CA_ROOT_NAME) -s $(SERVER_ADDRESS) -j "./bench/fake-register-data.json" -p "../sys-share/sys-account/proto/v2/sys_account_services.proto" -n "v2.sys_account.services.AuthService.Register" -r 1000 -c 100

this-sdk-backup:
	$(SDK_BIN) db-admin-service backup -s $(SERVER_ADDRESS) --tls --tls-ca-cert-file $(CA_ROOT_NAME) -o prettyjson

this-sdk-list-backup:
	$(SDK_BIN) db-admin-service list-backup -s $(SERVER_ADDRESS) --tls --tls-ca-cert-file $(CA_ROOT_NAME) -o prettyjson

this-sdk-restore:
	$(SDK_BIN) db-admin-service restore --backup-file $(BACKUP_FILE) --tls -s $(SERVER_ADDRESS) --tls-ca-cert-file $(CA_ROOT_NAME) -o prettyjson

this-flu-web-run:
	$(MAKE) flu-web-run

this-flu-desk-run:
	$(MAKE) flu-desk-run
	

