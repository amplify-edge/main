# hcl ( hcloud hertzner cli )
# https://github.com/hetznercloud/cli
include=./dwn.mk


### BIN
HCL_BIN=$(PWD)/hcloud
# https://github.com/hetznercloud/cli/releases/tag/v1.20.0
# WINDOWS: https://github.com/hetznercloud/cli/releases/download/v1.20.0/hcloud-windows-amd64.zip
# DARWIN: https://github.com/hetznercloud/cli/releases/download/v1.20.0/hcloud-macos-amd64.zip
# LINUX: https://github.com/hetznercloud/cli/releases/download/v1.20.0/hcloud-linux-amd64.tar.gz
HCL_BIN_VERSION=1.20.0
HCL_BIN_PLATFORM=??
# switch for OS (https://stackoverflow.com/questions/714100/os-detecting-makefile)
ifeq ($(OS_detected),Windows)
    HCL_BIN_PLATFORM=windows-amd64.zip
endif
ifeq ($(OS_detected),Darwin)
    HCL_BIN_PLATFORM=macos-amd64.zip
endif
ifeq ($(OS_detected),Linux)
    HCL_BIN_PLATFORM=linux-amd64.tar.gz
endif
HCL_BIN_FILE=hcloud-$(HCL_BIN_PLATFORM)
HCL_BIN_URL=https://github.com/hetznercloud/cli/releases/download/v$(HCL_BIN_VERSION)/$(HCL_BIN_FILE)


# Variables to override in makefile
HCL_CODE_PATH=$(PWD)/hellofly1	# local HCL_CODE_PATH to the code
HCL_APP_NAME=joe-hellofly		# fly app name
HCL_APP_ORG=getcourage.org		# fly org
HCL_APP_PORT=8080				# the Port our server needs to listen on.
HCL_DNS_DOMAIN=getcourage.org	# Domain for Certs
HCL_DNS_SUBDOMAIN=hello			# SubDomain for Certs


hcl-print:
	@echo
	@echo "-- HCLOUD (hcl) Dep --"
	@echo HCL_BIN_URL: $(HCL_BIN_URL)
	@echo HCL_BIN_URLFILE: $(HCL_BIN_FILE)
	@echo HCL_BIN: $(HCL_BIN)
	@echo
	@echo
	$(MAKE) DWN_URL=$(HCL_BIN_URL) DWN_FILENAME=$(HCL_BIN_FILE) DWN_BIN_FSPATH=$(HCL_BIN) dwn-print 
	@echo

	@echo -- Fly Variables --
	@echo HCL_CODE_PATH: $(HCL_CODE_PATH)
	@echo HCL_APP_NAME: $(HCL_APP_NAME)
	@echo HCL_APP_ORG: $(HCL_APP_ORG)
	@echo HCL_APP_PORT: $(HCL_APP_PORT)
	
	@echo HCL_DNS_DOMAIN: $(HCL_DNS_DOMAIN)
	@echo HCL_DNS_SUBDOMAIN: $(HCL_DNS_SUBDOMAIN)
	@echo

hcl-dep: hcl-dep-delete
	$(MAKE) DWN_URL=$(HCL_BIN_URL) DWN_FILENAME=$(HCL_BIN_FILE) DWN_BIN_FSPATH=$(HCL_BIN) dwn-download 
hcl-dep-delete:
	$(MAKE) DWN_URL=$(HCL_BIN_URL) DWN_FILENAME=$(HCL_BIN_FILE) DWN_BIN_FSPATH=$(HCL_BIN) dwn-delete 
	

hcl-init:
	cd $(HCL_CODE_PATH) && $(HCL_BIN) context create $(HCL_APP_NAME)

hcl-deploy:
	cd $(HCL_CODE_PATH) && $(HCL_BIN) deploy
hcl-destroy:
	cd $(HCL_CODE_PATH) && $(HCL_BIN) destroy $(HCL_APP_NAME)

hcl-console:
	open https://fly.io/apps
	
hcl-open:
	cd $(HCL_CODE_PATH) && $(HCL_BIN) open

hcl-status:
	@echo -- STATUS --
	cd $(HCL_CODE_PATH) && $(HCL_BIN) status --watch
	#cd $(HCL_CODE_PATH) && $(HCL_BIN) ips list

hcl-info:
	cd $(HCL_CODE_PATH) && $(HCL_BIN) info

	@echo -- CERTS --
	# flyctl certs check hello.getcourage.org
	cd $(HCL_CODE_PATH) && $(HCL_BIN) certs check $(HCL_DNS_SUBDOMAIN).$(HCL_DNS_DOMAIN)

	@echo -- RELEASES --
	# release history
	cd $(HCL_CODE_PATH) && $(HCL_BIN) releases

hcl-log:
	cd $(HCL_CODE_PATH) && $(HCL_BIN) logs


hcl-cert:
	# flyctl certs check $(HCL_DNS_SUBDOMAIN).$(HCL_DNS_DOMAIN) to get instructions.
	cd $(HCL_CODE_PATH) && $(HCL_BIN) certs add $(HCL_DNS_SUBDOMAIN).$(HCL_DNS_DOMAIN)


hcl-secrets:
	cd $(HCL_CODE_PATH) && $(HCL_BIN) secrets set BANKPASSWORD="M0M0NEY"
	cd $(HCL_CODE_PATH) && $(HCL_BIN) secrets list

hcl-volume:
	cd $(HCL_CODE_PATH) && $(HCL_BIN) volumes list
	#flyctl volumes create <name> --region ewr --size 1


	
	



