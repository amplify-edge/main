# boot repo makefiles
BOILERPLATE_FSPATH=./../../../../boot/boilerplate
include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/gitr.mk

# main repo make files ( will later be in boot) and fly and hug mapped to tools.mk.
# also use the dwn.mk for ALL the other tools we need, so we dont need gopaths and that slowness.
DEPLOY_BOILERPLATE_FSPATH=./../..
include $(DEPLOY_BOILERPLATE_FSPATH)/dwn.mk
include $(DEPLOY_BOILERPLATE_FSPATH)/hug.mk
include $(DEPLOY_BOILERPLATE_FSPATH)/fly.mk
include $(DEPLOY_BOILERPLATE_FSPATH)/gor.mk


### FLY Deployment Variables
FLY_CODE_PATH=$(PWD)/main/cmd/server
FLY_APP_BUILTIN=go
FLY_APP_NAME=joe-gcn-example
FLY_APP_ORG=personal
FLY_APP_PORT=8080

FLY_DNS_DOMAIN=fly.dev
FLY_DNS_SUBDOMAIN=$(FLY_APP_NAME)
FLY_PROD_DNS_DOMAIN=getcourage.org
FLY_PROD_DNS_SUBDOMAIN=$(FLY_APP_NAME)

#DEPLOY_ENV=PROD
DEPLOY_ENV=DEV

DEPLOY_BASEURL=
ifeq ($(DEPLOY_ENV),PROD)
    DEPLOY_BASEURL=http://$(FLY_PROD_DNS_SUBDOMAIN).$(FLY_PROD_DNS_DOMAIN) 
endif
ifeq ($(DEPLOY_ENV),DEV)
     DEPLOY_BASEURL=http://$(FLY_DNS_SUBDOMAIN).$(FLY_DNS_DOMAIN)
endif



print:
	@echo 
	$(MAKE) fly-print
	@echo

	@echo -- DEPLOY environment --
	@echo DEPLOY_ENV: $(DEPLOY_ENV)
	@echo DEPLOY_BASEURL: $(DEPLOY_BASEURL)
	@echo

dep-os: dep-os-delete
	$(MAKE) hug-dep
	$(MAKE) fly-dep
dep-os-delete:
	$(MAKE) hug-dep-delete
	$(MAKE) fly-dep-delete


### CODE RUN

client-run:
	cd ./client && flutter build web

client-build:
	cd ./client && flutter build web

	# pack into go server


local-run:
	cd $(FLY_CODE_PATH) && go run .
	# can call the code paths own make file also if you need to...
local-open:
	open http://localhost:8080


### DEPLOY

deploy-init:
	$(MAKE) fly-init
deploy-delete:
	$(MAKE) fly-destroy
deploy-watch:
	# leave running and it update you with the changes to the deployment as it happens.
	$(MAKE) fly-status
deploy-run:
	$(MAKE) fly-deploy
deploy-open:
	# opens browser to deployed site.
	$(MAKE) fly-open


