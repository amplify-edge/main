
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

SDK_BIN=./bin-all/maintemplatev2-sdk-cli
SERVER_BIN=./bin-all/maintemplatev2
# TODO. Make config.
EXAMPLE_SERVER_ADDRESS=127.0.0.1:9074

EXAMPLE_EMAIL = superadmin@getcouragenow.org
EXAMPLE_PASSWORD = superadmin

CONFIG_OUTPUT_DIR = $(PWD)/config
DB_ENCRYPT_KEY = yYz8Xjb4HBn4irGQpBWulURjQk2XmwES

EXAMPLE_EMAIL = gutterbacon@protonmail.com
EXAMPLE_PASSWORD = test1235
EXAMPLE_SUPER_EMAIL = superadmin@getcouragenow.org
EXAMPLE_SUPER_PASSWORD = superadmin
EXAMPLE_NEW_SUPER_EMAIL = gutterbacon@getcouragenow.org
EXAMPLE_NEW_SUPER_PASSWORD = SmokeOnTheWater70s
EXAMPLE_SYS_ACCOUNT_DB_ENCRYPT_KEY   = yYz8Xjb4HBn4irGQpBWulURjQk2XmwES
EXAMPLE_SYS_ACCOUNT_SENDGRID_API_KEY = SOME_SENDGRID_API_KEY
EXAMPLE_SYS_ACCOUNT_FILEDB_ENCRYPT_KEY   = A9bhbid5ODrKQVvd9MY17P5MZ
EXAMPLE_MOD_DISCO_DB_ENCRYPT_KEY = ZSXV8lTrfPeSuysDVm

EXAMPLE_CERT_DIR = ./certs
EXAMPLE_CERT_SERVER_NAME ?= $(EXAMPLE_CERT_DIR)/local.pem
EXAMPLE_CERT_SERVER_KEY ?= $(EXAMPLE_CERT_DIR)/local.key.pem
EXAMPLE_CA_ROOT_NAME ?= $(EXAMPLE_CERT_DIR)/rootca.pem
MKCERT_CA_ROOT_DIR = $(shell mkcert -CAROOT)

EXAMPLE_ACCOUNT_ID = ???
EXAMPLE_VERIFY_TOKEN = ???
EXAMPLE_ORG_ID  = ???
EXAMPLE_PROJECT_ID = ???


this-all: this-gen this-build this-run-server this-run-client

## Print all settings
this-print: ## print
	$(MAKE) os-print
	
	$(MAKE) flu-print

	$(MAKE) flu-gen-lang-print

	$(MAKE) go-print

this-build-delete:
	rm -rf $(SDK_BIN) $(SERVER_BIN)

this-build: this-build-delete
	## Flutter first
	$(MAKE) flu-web-build

	go build -o $(SDK_BIN) main/sdk-cli/main.go
	go build -o $(SERVER_BIN) main/server/main.go


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
		-V SYS_ACCOUNT_DB_ENCRYPT_KEY=$(EXAMPLE_SYS_ACCOUNT_DB_ENCRYPT_KEY) \
		-V SYS_ACCOUNT_FILEDB_ENCRYPT_KEY=$(EXAMPLE_SYS_ACCOUNT_FILEDB_ENCRYPT_KEY) \
		-V SYS_ACCOUNT_SENDGRID_API_KEY=$(EXAMPLE_SYS_ACCOUNT_SENDGRID_API_KEY)> $(CONFIG_OUTPUT_DIR)/sysaccount.yml
	jsonnet -S moddisco.jsonnet -V MOD_DISCO_DB_ENCRYPT_KEY=$(EXAMPLE_MOD_DISCO_DB_ENCRYPT_KEY) > $(CONFIG_OUTPUT_DIR)/moddisco.yml
	jsonnet -S bootstrap-server.jsonnet > $(CONFIG_OUTPUT_DIR)/bootstrap-server.yml
	jsonnet -S bootstrap-client.jsonnet > $(CONFIG_OUTPUT_DIR)/bootstrap-client.yml
	jsonnet -S main.jsonnet > $(CONFIG_OUTPUT_DIR)/main.yml

this-config-dep:
	jb install && jb update
	cd vendor/github.com/getcouragenow/sys/sys-account/service/go && jb install && jb update
	#cd vendor/github.com/getcouragenow/sys/sys-core/service/go && jb install && jb update
	cd vendor/github.com/getcouragenow/mod/mod-disco/service/go && jb install && jb update

this-cert-gen: this-cert-gen-delete
	@mkdir -p $(EXAMPLE_CERT_DIR)
	@mkcert -cert-file certs/local.pem -key-file certs/local.key.pem localhost 127.0.0.1 ::1
	@cp $(MKCERT_CA_ROOT_DIR)/rootCA.pem $(EXAMPLE_CA_ROOT_NAME)
	mkcert -install

this-cert-gen-delete:
	#mkcert -uninstall
	rm -rf $(EXAMPLE_CERT_DIR)/*.{pem,key,csr,crt}

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
	$(SDK_BIN) sys-account auth-service register --email $(EXAMPLE_EMAIL) --password $(EXAMPLE_PASSWORD) --password-confirm $(EXAMPLE_PASSWORD)

this-sdk-auth-signin:
	@echo Running Example Login Client
	$(SDK_BIN) sys-account auth-service signin --email $(EXAMPLE_EMAIL) --password $(EXAMPLE_PASSWORD) --server-addr $(EXAMPLE_SERVER_ADDRESS)

this-sdk-auth-signin-super:
	@echo Running Example Login Client
	# export access token to the .token file
	$(SDK_BIN) sys-account auth-service signin --email $(EXAMPLE_SUPER_EMAIL) --password $(EXAMPLE_SUPER_PASSWORD)

this-sdk-auth-verify:
	@echo Running Example Verify Client
	$(SDK_BIN) sys-account auth-service verify-account --account-id $(EXAMPLE_ACCOUNT_ID) --verify-token $(EXAMPLE_VERIFY_TOKEN)

this-sdk-accounts-new:
	@echo Running Example New Account
	$(SDK_BIN) sys-account account-service new-account -s $(EXAMPLE_SERVER_ADDRESS) --email gutterbacon@example.com --password gutterbacon123 --avatar-filepath ./testdata/avatar.png

this-sdk-accounts-list:
	@echo Running Example Accounts List
	$(SDK_BIN) sys-account account-service list-accounts

this-sdk-accounts-get:
	@echo Running Example Accounts Get
	$(SDK_BIN) sys-account account-service get-account --id $(EXAMPLE_ACCOUNT_ID)

this-sdk-accounts-update:
	@echo Running Example Accounts Update
	$(SDK_BIN) sys-account account-service update-account --id $(EXAMPLE_ACCOUNT_ID)  --disabled

this-sdk-accounts-assign-super:
	@echo Assigning Account to Superuser
	$(SDK_BIN) sys-account account-service assign-account-to-role --assigned-account-id $(EXAMPLE_ACCOUNT_ID) --role-all --role-role 4

this-sdk-org-new:
	@echo Running Example Create Org
	$(SDK_BIN) sys-account org-proj-service new-org --name "ORG 1" --logo-filepath "./testdata/avatar.png"

this-sdk-org-get:
	@echo Running Example Get Org
	$(SDK_BIN) sys-account org-proj-service get-org --id $(EXAMPLE_ORG_ID)

this-sdk-org-list:
	@echo Running Example List Org
	$(SDK_BIN) sys-account org-proj-service list-org

this-sdk-org-update:
	@echo Running Example Update Org
	$(SDK_BIN) sys-account org-proj-service update-org --id $(EXAMPLE_ORG_ID) --name "ORG 2" --contact "contact@getcouragenow.org"

this-sdk-project-new:
	@echo Running Example Create New Project
	$(SDK_BIN) sys-account org-proj-service new-project --org-id $(EXAMPLE_ORG_ID) --name PROJECT1 --logo-filepath "./testdata/avatar.png"

this-sdk-project-list:
	@echo Running Example List Project
	$(SDK_BIN) sys-account org-proj-service list-project

this-sdk-project-get:
	@echo Running Example Get Project
	$(SDK_BIN) sys-account org-proj-service get-project --id $(EXAMPLE_PROJECT_ID)

this-sdk-bench: this-sdk-bench-start this-sdk-bench-01 this-sdk-bench-02
	@echo -- Example SDK Benchmark: End --

this-sdk-bench-start:
	@echo -- Example SDK Benchmark: Start --

	@echo Running Example SDK Benchmark, Run server first!

this-sdk-bench-01:
	# Small
	@echo USERS: 10
	@echo DB CONNECTIONS: 1
	$(SDK_BIN) sys-bench -e -t $(EXAMPLE_CA_ROOT_NAME) -s $(EXAMPLE_SERVER_ADDRESS) -j "./bench/fake-register-data.json" -p "../sys-share/sys-account/proto/v2/sys_account_services.proto" -n "v2.sys_account.services.AuthService.Register" -r 10 -c 1


this-sdk-bench-02:
	# Medium
	@echo USERS: 100
	@echo DB CONNECTIONS: 10
	$(SDK_BIN) sys-bench -e -t $(EXAMPLE_CA_ROOT_NAME) -s $(EXAMPLE_SERVER_ADDRESS) -j "./bench/fake-register-data.json" -p "../sys-share/sys-account/proto/v2/sys_account_services.proto" -n "v2.sys_account.services.AuthService.Register" -r 100 -c 10

this-sdk-bench-03:
	# Medium
	@echo USERS: 1000
	@echo DB CONNECTIONS: 100
	$(SDK_BIN) sys-bench -e -t $(EXAMPLE_CA_ROOT_NAME) -s $(EXAMPLE_SERVER_ADDRESS) -j "./bench/fake-register-data.json" -p "../sys-share/sys-account/proto/v2/sys_account_services.proto" -n "v2.sys_account.services.AuthService.Register" -r 1000 -c 100

this-sdk-backup:
	$(SDK_BIN) db-admin-service backup -s $(EXAMPLE_SERVER_ADDRESS) --tls --tls-ca-cert-file $(EXAMPLE_CA_ROOT_NAME) -o prettyjson

this-sdk-list-backup:
	$(SDK_BIN) db-admin-service list-backup -s $(EXAMPLE_SERVER_ADDRESS) --tls --tls-ca-cert-file $(EXAMPLE_CA_ROOT_NAME) -o prettyjson

this-sdk-restore:
	$(SDK_BIN) db-admin-service restore --backup-file $(EXAMPLE_BACKUP_FILE) --tls -s $(EXAMPLE_SERVER_ADDRESS) --tls-ca-cert-file $(EXAMPLE_CA_ROOT_NAME) -o prettyjson

this-flu-web-run:
	$(MAKE) flu-web-run

this-flu-desk-run:
	$(MAKE) flu-desk-run
	

