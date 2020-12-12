# FlyCtl ( Fly)
# https://fly.io/docs/hands-on/sign-up/
# https://github.com/fly-examples
# https://community.fly.io/
# https://api.fly.io/graphql
# https://fly.io/docs/getting-started/golang/

include=./dwn.mk


### BIN
FLY_BIN=$(PWD)/flyctl
# https://github.com/superfly/flyctl/releases/tag/v0.0.153
# https://github.com/superfly/flyctl/releases/download/v0.0.153/flyctl_0.0.153_macOS_x86_64.tar.gz
FLY_BIN_VERSION=0.0.154
FLY_BIN_PLATFORM=??
# switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
ifeq ($(OS_detected),Windows)
    FLY_BIN_PLATFORM=Windows_x86_64
endif
ifeq ($(OS_detected),Darwin)
    FLY_BIN_PLATFORM=macOS_x86_64
endif
ifeq ($(OS_detected),Linux)
    FLY_BIN_PLATFORM=Linux_x86_64
endif
FLY_BIN_FILE=flyctl_$(FLY_BIN_VERSION)_$(FLY_BIN_PLATFORM).tar.gz
FLY_BIN_URL=https://github.com/superfly/flyctl/releases/download/v$(FLY_BIN_VERSION)/$(FLY_BIN_FILE)


# OPS

FLY_CODE_PATH=$(PWD)/hellofly1	# local FLY_CODE_PATH to the code
FLY_APP_BUILTIN=go				# fly Buildin to use (go, other)
FLY_APP_NAME=joe-hellofly		# fly app name
FLY_APP_ORG=getcourage.org		# fly org
FLY_APP_PORT=8080				# the Port our server needs to listen on.
FLY_DNS_DOMAIN=getcourage.org	# Domain for Certs
FLY_DNS_SUBDOMAIN=hello			# SubDomain for Certs


fly-print:
	@echo
	@echo "-- FlyCTL (fly) Dep --"
	@echo FLY_BIN_URL: $(FLY_BIN_URL)
	@echo FLY_BIN_URLFILE: $(FLY_BIN_FILE)
	@echo FLY_BIN: $(FLY_BIN)
	@echo
	@echo
	$(MAKE) DWN_URL=$(FLY_BIN_URL) DWN_FILENAME=$(FLY_BIN_FILE) DWN_BIN_FSPATH=$(FLY_BIN) dwn-print 
	@echo

	@echo -- Fly Variables --
	@echo FLY_CODE_PATH: $(FLY_CODE_PATH)
	@echo FLY_APP_BUILTIN: $(FLY_APP_BUILTIN)
	@echo FLY_APP_NAME: $(FLY_APP_NAME)
	@echo FLY_APP_ORG: $(FLY_APP_ORG)
	@echo FLY_APP_PORT: $(FLY_APP_PORT)
	
	@echo FLY_DNS_DOMAIN: $(FLY_DNS_DOMAIN)
	@echo FLY_DNS_SUBDOMAIN: $(FLY_DNS_SUBDOMAIN)
	@echo

fly-dep: fly-dep-delete
	$(MAKE) DWN_URL=$(FLY_BIN_URL) DWN_FILENAME=$(FLY_BIN_FILE) DWN_BIN_FSPATH=$(FLY_BIN) dwn-download 
fly-dep-delete:
	$(MAKE) DWN_URL=$(FLY_BIN_URL) DWN_FILENAME=$(FLY_BIN_FILE) DWN_BIN_FSPATH=$(FLY_BIN) dwn-delete 
	

fly-init:
	#cd $(FLY_CODE_PATH) && $(FLY_BIN) auth signup
	cd $(FLY_CODE_PATH) && $(FLY_BIN) auth token
	cd $(FLY_CODE_PATH) && $(FLY_BIN) auth whoami

	cd $(FLY_CODE_PATH) && $(FLY_BIN) init --builtin $(FLY_APP_BUILTIN) --name $(FLY_APP_NAME) --org $(FLY_APP_ORG) --port $(FLY_APP_PORT)

fly-deploy:
	cd $(FLY_CODE_PATH) && $(FLY_BIN) deploy
fly-destroy:
	cd $(FLY_CODE_PATH) && $(FLY_BIN) destroy $(FLY_APP_NAME)

fly-console:
	open https://fly.io/apps
	
fly-open:
	cd $(FLY_CODE_PATH) && $(FLY_BIN) open

fly-status:
	@echo -- STATUS --
	cd $(FLY_CODE_PATH) && $(FLY_BIN) status --watch
	#cd $(FLY_CODE_PATH) && $(FLY_BIN) ips list

fly-info:
	cd $(FLY_CODE_PATH) && $(FLY_BIN) info

	@echo -- CERTS --
	# flyctl certs check hello.getcourage.org
	cd $(FLY_CODE_PATH) && $(FLY_BIN) certs check $(FLY_DNS_SUBDOMAIN).$(FLY_DNS_DOMAIN)

	@echo -- RELEASES --
	# release history
	cd $(FLY_CODE_PATH) && $(FLY_BIN) releases

fly-log:
	cd $(FLY_CODE_PATH) && $(FLY_BIN) logs


fly-cert:
	# flyctl certs check $(FLY_DNS_SUBDOMAIN).$(FLY_DNS_DOMAIN) to get instructions.
	cd $(FLY_CODE_PATH) && $(FLY_BIN) certs add $(FLY_DNS_SUBDOMAIN).$(FLY_DNS_DOMAIN)


fly-secrets:
	cd $(FLY_CODE_PATH) && $(FLY_BIN) secrets set BANKPASSWORD="M0M0NEY"
	cd $(FLY_CODE_PATH) && $(FLY_BIN) secrets list

fly-volume:
	cd $(FLY_CODE_PATH) && $(FLY_BIN) volumes list
	#flyctl volumes create <name> --region ewr --size 1


	
	



