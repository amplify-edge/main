.DEFAULT_GOAL       := help
VERSION             := v0.0.0
TARGET_MAX_CHAR_NUM := 20

GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)


GCP_ZONE ?= europe-west3-a
GCP_REGION ?= europe-west3
IMG_LOCALE ?= en
MAX_NODES ?= 15
RELEASE_NAME ?= dev
HOST_PATH ?= /tmp/data

MINIKUBE_VMDRIVER :=
ifeq ($(OS),Windows_NT)
    MINIKUBE_VMDRIVER += virtualbox
else
    OSNAME := $(shell uname -s)
    ifeq ($(OSNAME), Linux)
        MINIKUBE_VMDRIVER += kvm2
    else ifeq ($(OSNAME), Darwin)
        MINIKUBE_VMDRIVER += hyperkit
    endif
endif

.PHONY: help build prepare flu-web-run flu-mob-run clean

## Show help
help:
	@echo ''
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

## print
print:
	@echo GCP_PROJECT: 	$(GCP_PROJECT)
	@echo GCP_USER: 	$(GCP_USER)
	@echo GCP_ZONE: 	$(GCP_ZONE)
	@echo GCP_REGION: 	$(GCP_REGION)

## gcloud-print
gcloud-print:
	gcloud config configurations list

## gcloud-print
gcloud-set:
	gcloud config configurations activate $(GCP_PROJECT)

check-env:
ifndef GCP_PROJECT
	$(error define GCP_PROJECT environment variable)
endif
ifndef GCP_USER
	$(error define GCP_USER environment variable)
endif

## GCP configuration
gke-setup: check-env
	@echo GKEConf
	@gcloud projects add-iam-policy-binding ${GCP_PROJECT} --member user:${GCP_USER} --role roles/iam.serviceAccountKeyAdmin
	#mkdir -p ~/.getcouragenow/
	mkdir -p ${HOME}/.${GCP_PROJECT}
	@gcloud config set project ${GCP_PROJECT}
	@gcloud iam service-accounts create ${GCP_PROJECT}-sa
	@gcloud services enable container.googleapis.com
	@gcloud projects add-iam-policy-binding ${GCP_PROJECT} --member serviceAccount:${GCP_PROJECT}-sa@${GCP_PROJECT}.iam.gserviceaccount.com --role roles/container.admin
	@gcloud projects add-iam-policy-binding ${GCP_PROJECT} --member serviceAccount:${GCP_PROJECT}-sa@${GCP_PROJECT}.iam.gserviceaccount.com --role roles/storage.admin
	@gcloud iam service-accounts keys create ~/.getcouragenow/${GCP_PROJECT}.json --iam-account ${GCP_PROJECT}-sa@${GCP_PROJECT}.iam.gserviceaccount.com 

## GKE cluster initialize
gke-create: check-env
	@echo GKECreate
	@gcloud container clusters create ${GCP_PROJECT} --zone ${GCP_ZONE} --enable-autoscaling --max-nodes ${MAX_NODES} 
	@gcloud compute addresses create ${GCP_PROJECT}-static-ip --region ${GCP_REGION}


## GKE resize
gke-resize:
ifndef GCP_PROJECT
	$(error define GCP_PROJECT environment variable)
endif
ifndef GCP_NODES_NUM
	$(error define GCP_NODES_NUM environment variable)
endif
	@gcloud container clusters resize ${GCP_PROJECT} --node-pool default-pool --num-nodes ${GCP_NODES_NUM} --zone ${GCP_ZONE}

## GKE destroy
gke-destroy:
ifndef GCP_PROJECT
	$(error define GCP_PROJECT environment variable)
endif
	@gcloud container clusters delete ${GCP_PROJECT}


## GKE cluster variables
gke-vars:
	@echo GKEVariables
	@echo "GKE_PROJECT: "
	@echo "\t ${GCP_PROJECT}"
	@echo "GKE_IP: " 
	@echo "\t $$(gcloud compute addresses describe ${GCP_PROJECT}-static-ip --region ${GCP_REGION} | grep "address:" | cut -d ':' -f2)"
	@echo "GKE_EMAIL: "
	@echo "\t ${GCP_PROJECT}-sa@${GCP_PROJECT}.iam.gserviceaccount.com"
	@echo "GKE_KEY: "
	@echo echo $(awk '1' ~/.getcouragenow/${GCP_PROJECT}.json | base64 | tr -d '\n')

## quick fixes for ci error on issue
gke-clean-services:
	@kubectl delete service ci-flutter
	@kubectl delete service ci-envoy
	@kubectl delete service ci-maintemplate

## Configure minikube vm-driver
minikube-config: 
	minikube config set vm-driver ${MINIKUBE_VMDRIVER}
	$(MAKE) minikube-clean

minikube-clean:
	minikube delete
	minikube start --insecure-registry="127.0.0.1/24"

minikube-run-registry:
	./scripts/insecure-registries.sh
	
## Minikube start process, enable insecure registries
minikube-start: minikube-run-registry
	# RUN this in separate SHELL please
	@echo Running
	@minikube addons enable ingress
	@minikube addons enable registry
	#@kubectl port-forward 9074 80

minikube-use-internal-docker:
	@eval $(minikube docker-env)

copy-frontend:
	@cd ../client && flutter build web
	@cp -rf ../client/build/web flutter/

## (Re)-deploy frontend and backend on minikube
minikube-deploy: copy-frontend minikube-use-internal-docker apply-secrets docker-images docker-push
	helm install ${RELEASE_NAME}-paas ./deployments/devs \
		--set hostPath=${HOST_PATH}
	helm install ${RELEASE_NAME} ./deployments/helm \
		--set domainSetup=false \
		--set flutterImage=localhost:5000/flutter-web:latest \
		--set maintemplateServerImage=localhost:5000/maintemplate:latest \
		--set flutterReplicas=1 
	@rm -rf flutter/web

apply-secrets:
	@kubectl apply -f ${PWD}/keys/getcourage-secret.yaml
	@kubectl apply -f ${PWD}/keys/minio-creds-secret.yaml
	@kubectl apply -f ${PWD}/keys/keypair-secrets.yaml

docker-images:
	@docker build -t localhost:5000/flutter-web flutter/
	@docker build -t localhost:5000/maintemplate -f dockers/Dockerfile-dev .

docker-push:
	@docker push localhost:5000/maintemplate:latest
	@docker push localhost:5000/flutter-web:latest

## Cleans minikube builds (services, deployments, pods)
minikube-clean-builds:
	@helm uninstall dev-paas
	@helm uninstall dev

## Source env
source-env:
	@echo -n "Sourcing env"
	./scripts/source-env.sh

## Generate app secrets
gen-app-secrets:
	@echo -n "Make sure you've correctly edited the ENV file & run make source-env"
	@rm -rf keys/*.yaml
	make -C ../../mod-account/server/authz gen-secrets
	@go run cmd/appsecret/appsecret.go -o ${PWD}/keys/

## Install prequisites
install-prequisites:
	@echo -n "Installing prequisites"
	GO111MODULE=off go get -u -v github.com/cloudflare/cfssl/cmd/...
	./scripts/local-dev-setup.sh