SHARED_FSPATH=./../../includes

include $(SHARED_FSPATH)/help.mk
include $(SHARED_FSPATH)/flu.mk

override FLU_SAMPLE_NAME = example
override FLU_SAMPLE_FSPATH = $(PWD)/example/client/flu
override FLU_LIB_NAME = mod_survey
override FLU_LIB_FSPATH = $(PWD)/service/flu
override FLU_LANG_LOCALIZATION_DIR = $(FLU_LIB_FSPATH)/lib/pkg/i18n

EXAMPLE_EMAIL = superadmin@amplify-cms.org
EXAMPLE_PASSWORD = superadmin
EXAMPLE_SERVER_ADDRESS = 127.0.0.1:8888

all: print gen build print-end

## Print all settings
print: ## print
	@echo
	@echo "-- BOOTSTRAPPER: start --"
	@echo
	@booty os-print
	@booty gw print
	$(MAKE) flu-print
	$(MAKE) flu-gen-lang-print


print-end:
	@echo
	@echo "-- BOOTSTRAPPER: end --"
	@echo


build: build-delete
	@echo 'Building example golang and flutter binaries'
	mkdir -p bin/all/{cli,client}/{go,flu}
	@echo 'Building Golang binaries'
	#go build -v -o bin-all/cli/go/ ./example/cli/go/main.go
	@echo 'Building Flutter binary'
#	$(MAKE) flu-web-build

build-delete:
	@echo 'Removing built go and flutter binaries'
	rm -rf bin-all/{cli,client,server}/{go,flu}/*

gen: gen-delete
	@echo "Generating GRPC models and services for Go & Flutter"
	$(MAKE) flu-config
	@mkdir -p service/{flu/lib,go}/rpc/v2
	cd proto/v2/ && booty jb install && booty jb update
	@go generate
	@echo "Generating Flutter Config"
	# $(MAKE) flu-gen-all
	# $(MAKE) flu-gen-lang

config-gen: config-clean
	@echo Generating Config
	@mkdir -p service/flu/lib/assets
	@booty jsonnet -S service/go/flutter_base_repo.jsonnet \
		-V SYS_CORE_HOST="127.0.0.1" \
		-V SYS_CORE_PORT="8888" \
		> ./service/flu/lib/assets/hostconfig.json

config-clean:
	@echo Deleting previously generated config
	rm -rf ./service/flu/lib/assets/hostconfig.json

gen-delete: config-clean
	@echo 'Removing generated protobuf definition (Go and Flutter)'
	rm -rf service/{flu/lib,go}/rpc/v2/*.{dart,go}