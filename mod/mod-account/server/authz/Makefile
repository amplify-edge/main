.DEFAULT_GOAL       := help
VERSION             := v0.0.0
TARGET_MAX_CHAR_NUM := 20

GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

RANDTAG := $(shell head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13 ; echo '')

#.PHONY: help build prepare flu-web-run flu-mob-run clean

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

## Generate keypair (public and private) put it in k8s secrets format (yaml)
gen-secrets:
	@rm -rf ${PWD}/keys/*.yaml
	@mkdir -p ${PWD}/keys
	@go run cmd/jwtkey/jwtkey.go -a RSA -p ${PWD}/keys

apply-secrets-local:
	kubectl apply -f keys/keypair-secrets.yaml

## Outputs GKE secrets to keys directory in the main file
gke-encrypt-secrets:
	@gcloud kms encrypt --location=${KMS_REGION} \
		--keyring=${KEYRING_NAME} \
		--key=${KEYNAME} \
		--ciphertext-file=keys/keypair-secrets.yaml \
		--plaintext=

## Run unit tests on keyutil library
run-unit-tests:
	@echo '${GREEN}Running unit tests{RESET}'
	go test -v pkg/keyutil/*_test.go

## Cloud-KMS setup
gke-init-kms:
	@echo '${YELLOW}Make sure GCP_PROJECT, GCP_ZONE, GCP_USER, GKE_KEYRING_NAME, GKE_KEYRING_ZONE, GKE_KEYNAME env is valid${RESET}'
	@echo '${YELLOW}and `gcloud init` is correctly setup${RESET}'
	$(shell ./scripts/init-kms.sh)

