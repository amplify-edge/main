.DEFAULT_GOAL       := help
VERSION             := v0.0.0
TARGET_MAX_CHAR_NUM := 20
SHELL := /usr/bin/env bash

GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

RANDTAG := $(shell head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13 ; echo '')

KEYRING_NAME ?= authz_keyring
KEY_NAME ?= authz_key_$(uuidgen -t)
KMS_REGION ?= global

.PHONY: help

## Show help
help:
	@echo 'Server for ext-authz'
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

## Pull down gsheets data
get-data:
	@echo ''
	@echo '$(YELLOW)IF THE CONFIGS CANNOT BE FOUND, MAKE SURE TO RUN $(WHITE)make build$(YELLOW) IN THE $(WHITE)boostrap/tools/i18n$(YELLOW) [github.com/getcouragenow/bootstrap]'
	@echo ''
	@echo 'If there are many 403 errors you may have ran into the google api limiter, check the output folder before assuming nothing made it through$(RESET)'
	@echo ''
	@mkdir -p ./data/config
	@echo "*" > ./data/.gitignore
	@cp ${GOPATH}/config/i18n/datadumpconfig.yml ./data/config/datadumpconfig.yml
	@cd data && ${GOPATH}/bin/i18n gsheet -o datadump

## Removes data folder and all of it's contents
del-data:
	@if [ -f ./data ]; then rm -r ./data; fi
	@echo '${GREEN}Data Removed${RESET}'
	@echo 'Run ${YELLOW}make get-data${RESET} to regenerate the data'

proto-init:
	@type -p protoc > /dev/null 2>&1 || echo 'Please install protobuf first according to your package manager'
	@go get -u google.golang.org/protobuf/cmd/protoc-gen-go

modules-install:
	@go mod tidy
	@go mod vendor

## Compiles protobuf
proto-go: proto-init modules-install
	protoc -I vendor/ -I api/ api/*.proto --go_out=pkg/api/

## Generate protoc
