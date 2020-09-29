.DEFAULT_GOAL       := help
VERSION             := v0.0.0
TARGET_MAX_CHAR_NUM := 20

GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

RANDTAG := $(shell head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13 ; echo '')


# minio
# TODO: REMOVE !!
MINIO_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE
MINIO_SECRET_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
MINIO_PORT=9000

#.PHONY: help build prepare flu-web-run flu-mob-run clean

## Show help
help:
	@echo 'Server for mod-main'
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

# steps:
# 1- make i18n : install i18n tool 
# 2- make get-data : download dumy data from googlesheet
# 3- make minio: start docker minio container
#  run tests
# 4- make go-test : run mod-main server tests
#  or 
# 4- make go-srv : run server
# 5- make go-cli : run client

dep:
	# install i18n tool 
	# TODO FIX as it does not compile
	GO111MODULE=off go get -u -v github.com/getcouragenow/bootstrap
	cd ${GOPATH}/src/github.com/getcouragenow/bootstrap/tool/i18n && make build 
	i18n

## Pull down gsheets data
data-get:
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
data-del:
	@if [ -f ./data ]; then rm -r ./data; fi
	@echo '${GREEN}Data Removed${RESET}'
	@echo 'Run ${YELLOW}make get-data${RESET} to regenerate the data'

## Run GO Server
go-srv:
	go run cmd/server.go

## Run GO cli
go-cli:
	## TODO Fix as does not compile
	go run cmd/client.go

## Run go tests
go-test:
	go test -v ./...

## Run Minio
minio-run:
	rm -rf ${HOME}/minio_volume
	mkdir -p ${HOME}/minio_volume

	docker run -p ${MINIO_PORT}:${MINIO_PORT} --name minio4 \
	-e "MINIO_ACCESS_KEY=${MINIO_ACCESS_KEY}" \
	-e "MINIO_SECRET_KEY=${MINIO_SECRET_KEY}" \
	-v ${HOME}/minio_volume:/minio_volume \
	minio/minio server /minio_volume

## Minio Open URL
minio-open:
	open http://127.0.0.1:${MINIO_PORT}
