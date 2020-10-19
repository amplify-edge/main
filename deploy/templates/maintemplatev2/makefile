
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

SDK_BIN=$(PWD)/bin-all/sdk-cli
SERVER_BIN=$(PWD)/bin-all/main
# TODO. Make config.
SERVER_ADDRESS=127.0.0.1:8888

EXAMPLE_EMAIL = superadmin@getcouragenow.org
EXAMPLE_PASSWORD = superadmin
EXAMPLE_SERVER_ADDRESS = 127.0.0.1:9074

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
	rm -rf ./bin-all

this-build: this-build-delete this-config-delete this-config-gen

	mkdir -p ./bin-all

	## Flutter first
	$(MAKE) flu-gen-all
	$(MAKE) flu-gen-lang-all
	$(MAKE) flu-web-build

	go build -o $(SDK_BIN) main/sdk-cli/main.go
	go build -o $(SERVER_BIN) main/server/main.go

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

this-sdk-run:
	$(SDK_BIN)

this-server-run:
	rm -rf db/gcn.db && $(SERVER_BIN) -c ./config/syscore.yml -a ./config/sysaccount.yml -p 9074

this-example-sdk-auth:
	@echo Running Example Register Client
	$(SDK_BIN) sys-account auth-service register --email $(EXAMPLE_EMAIL) --password $(EXAMPLE_PASSWORD) --password-confirm $(EXAMPLE_PASSWORD) --server-addr $(SERVER_ADDRESS)
	@echo Running Example Login Client
	$(SDK_BIN) sys-account auth-service login --email $(EXAMPLE_EMAIL) --password $(EXAMPLE_PASSWORD) --server-addr $(SERVER_ADDRESS)

this-flu-web-run:
	$(MAKE) flu-web-run

this-flu-desk-run:
	$(MAKE) flu-desk-run
	

