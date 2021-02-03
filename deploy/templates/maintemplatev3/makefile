
SHARED_FSPATH=./../../../../shared
BOILERPLATE_FSPATH=$(SHARED_FSPATH)/boilerplate

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/gitr.mk
include $(BOILERPLATE_FSPATH)/go.mk
include $(BOILERPLATE_FSPATH)/flu.mk
include $(BOILERPLATE_FSPATH)/tool.mk

FLU_LIB_NAME = client
FLU_SAMPLE_NAME = client
FLU_SAMPLE_FSPATH = $(PWD)/$(FLU_SAMPLE_NAME)

SYS_SDK_BIN=$(GOPATH)/bin/mainsys-cli
SYS_SERVER_BIN=$(GOPATH)/bin/mainsys
MOD_SDK_BIN=$(GOPATH)/bin/mainmod-cli
MOD_SERVER_BIN=$(GOPATH)/bin/mainmod

# TODO. Make config.
SYS_SERVER_ADDRESS=127.0.0.1:9075
MOD_SERVER_ADDRESS=127.0.0.1:9074

EXAMPLE_EMAIL = superadmin@amplify-cms.org
EXAMPLE_PASSWORD = superadmin
EXAMPLE_SERVER_ADDRESS = 127.0.0.1:9074
EXAMPLE_ACCOUNT_ID = ""

CONFIG_OUTPUT_DIR = $(PWD)/config
DB_ENCRYPT_KEY = yYz8Xjb4HBn4irGQpBWulURjQk2XmwES

this-all: this-build

## Print all settings
this-print: ## print

	$(MAKE) os-print
	
	$(MAKE) flu-print

	$(MAKE) flu-gen-lang-print

	$(MAKE) go-print

this-build-delete:
	rm -rf  $(SYS_SDK_BIN) $(SYS_SERVER_BIN) $(MOD_SDK_BIN) $(MOD_SERVER_BIN)


this-build: this-build-delete this-config-delete this-config-gen
	## Flutter first
	$(MAKE) flu-gen-all
	$(MAKE) flu-gen-lang-all
	$(MAKE) flu-web-build

	go build -o $(SYS_SERVER_BIN) ./mainsys/server/main.go
	go build -o $(SYS_SDK_BIN) ./mainsys/sdk-cli/main.go
	go build -o $(MOD_SERVER_BIN) ./mainmod/server/main.go
	go build -o $(MOD_SDK_BIN) ./mainmod/cli/main.go

this-config-delete:
	rm -rf $(CONFIG_OUTPUT_DIR)/*

this-config-gen: this-config-dep
	mkdir -p $(CONFIG_OUTPUT_DIR)
	@echo Generating Config
	jsonnet -S sysaccount.jsonnet > $(CONFIG_OUTPUT_DIR)/sysaccount.yml
	jsonnet -S syscore.jsonnet -V SYS_CORE_DB_ENCRYPT_KEY=$(DB_ENCRYPT_KEY) > $(CONFIG_OUTPUT_DIR)/syscore.yml

this-config-dep:
	jb install

this-build-deep:
	# DO bottom up so we get the embeddings i think.
	#cd ../sys-core && make this-build

	#cd ../mod-main && make this-build
	
	# finally build the top :)
	$(MAKE) this-build



### RUN

this-sys-sdk-run:
	$(SYS_SDK_BIN)

this-sys-server-run:
	mkdir -p db
	rm -rf db/*.db && $(SYS_SERVER_BIN) -c ./config/syscore.yml -a ./config/sysaccount.yml -p 9075

# Run this only after sysserver is running!
this-mod-server-run:
	$(MOD_SERVER_BIN) -p 9074 -s 9075 -m 127.0.0.1 -d ./client/build/web

this-sys-sdk-auth-signup:
	@echo Running Example Register Client
	$(SYS_SDK_BIN) sys-account auth-service register --email $(EXAMPLE_EMAIL) --password $(EXAMPLE_PASSWORD) --password-confirm $(EXAMPLE_PASSWORD) --server-addr $(SYS_SERVER_ADDRESS)

this-sys-sdk-auth-signin:
	@echo Running Example Login Client
	$(SYS_SDK_BIN) sys-account auth-service login --email $(EXAMPLE_EMAIL) --password $(EXAMPLE_PASSWORD) --server-addr $(SYS_SERVER_ADDRESS)

this-sys-sdk-accounts-list:
	@echo Running Example Accounts List
	$(SYS_SDK_BIN) sys-account account-service list-accounts --server-addr $(SYS_SERVER_ADDRESS)

this-mod-sdk-get:
	@echo Running Dummy GetAccount
	$(MOD_SDK_BIN) mod-main mod-dummy mod-dummy dummy-service get-account --id $(EXAMPLE_ACCOUNT_ID) -s $(MOD_SERVER_ADDRESS)
