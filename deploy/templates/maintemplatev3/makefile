
SHARED_FSPATH=./../../../../shared
BOILERPLATE_FSPATH=$(SHARED_FSPATH)/boilerplate

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/gitr.mk


SDK_BIN=$(PWD)/bin-all/sdk-cli
SERVER_BIN=$(PWD)/bin-all/sys-main
# TODO. Make config.
SERVER_ADDRESS=127.0.0.1:8888

EXAMPLE_EMAIL = superadmin@getcouragenow.org
EXAMPLE_PASSWORD = superadmin
EXAMPLE_SERVER_ADDRESS = 127.0.0.1:9074

this-all: this-build

## Print all settings
this-print: ## print

	$(MAKE) os-print
	
	$(MAKE) flu-print

	$(MAKE) flu-gen-lang-print

	$(MAKE) go-print

this-build-delete:
	rm -rf ./bin-all

this-build: this-build-delete

	mkdir -p ./bin-all

	## Flutter first
	#$(MAKE) flu-gen-all
	#$(MAKE) flu-gen-lang-all
	#$(MAKE) flu-web-build

	cd mainsys/sdk-cli && go build -o $(SDK_BIN) .
	cd mainsys/server && go build -o $(SERVER_BIN) .

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
	rm -rf getcouragenow.db && $(SERVER_BIN)

this-example-sdk-auth:
	@echo Running Example Registe±–r Client
	$(SDK_BIN) sys-account auth-service register --email $(EXAMPLE_EMAIL) --password $(EXAMPLE_PASSWORD) --password-confirm $(EXAMPLE_PASSWORD) --server-addr $(SERVER_ADDRESS)
	@echo Running Example Login Client
	$(SDK_BIN) sys-account auth-service login --email $(EXAMPLE_EMAIL) --password $(EXAMPLE_PASSWORD) --server-addr $(SERVER_ADDRESS)



