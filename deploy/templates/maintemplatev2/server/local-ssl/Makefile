.DEFAULT_GOAL       := help
VERSION             := v0.0.0
TARGET_MAX_CHAR_NUM := 20

GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

.PHONY: help install-certs

## Show help
help:
	@echo ''
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}Edit ca config in${RESET} ${GREEN}ca subdir${RESET} '
	@echo '  ${YELLOW}Also edit maintemplate config in${RESET} ${GREEN}maintemplate subdir${RESET}'
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
 

## Generate CA Certificates from config in ca subdir
gen-ca:
	@cfssl gencert -initca ca/ca-csr.json| cfssljson -bare ca -

## Generate Server certificates from maintemplate config in maintemplate subdir
gen-certs:
	./scripts/gen-certs.sh

## Install CSR (Certificate Signing Request) to K8S authority
install-certs: gen-ca gen-certs
	@kubectl apply -f ./maintemplate-csr-real.yaml
	@kubectl certificate approve maintemplate.default.svc.cluster.local
