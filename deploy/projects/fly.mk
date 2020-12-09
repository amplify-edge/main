
# https://fly.io/docs/hands-on/sign-up/
# https://github.com/fly-examples
# https://community.fly.io/

# https://api.fly.io/graphql

#https://fly.io/docs/getting-started/golang/

#CTL=$(PWD)/flyctl			# local install ( normally for development)
CTL=flyctl					# global on path



CODE_PATH=$(PWD)/hellofly1	# local CODE_PATH to the code

APP_BUILTIN=go				# fly Buildin to use (go, other)
APP_NAME=joe-hellofly		# fly app name
APP_ORG=getcourage.org		# fly org
APP_PORT=8080				# the Port our server needs to listen on.

DNS_DOMAIN=getcourage.org	# Domain for Certs
DNS_SUBDOMAIN=hello			# SubDomain for Certs


fly-print:

	@echo -- Fly deploy --
	@echo CODE_PATH: $(CODE_PATH)
	@echo APP_BUILTIN: $(APP_BUILTIN)
	@echo APP_NAME: $(APP_NAME)
	@echo APP_ORG: $(APP_ORG)
	@echo APP_PORT: $(APP_PORT)
	
	@echo DNS_DOMAIN: $(DNS_DOMAIN)
	@echo DNS_SUBDOMAIN: $(DNS_SUBDOMAIN)


fly-dep:
	# See: https://fly.io/docs/hands-on/installing/

	# raw code:
		# https://github.com/superfly/flyctl/releases
	
	# mac:
		# brew install superfly/tap/flyctl
		# OR
		# curl -L https://fly.io/install.sh | sh
	# linux:
		# curl -L https://fly.io/install.sh | sh
	# windows:
		#  iwr https://fly.io/install.ps1 -useBasicParsing | iex

fly-init:
	#cd $(CODE_PATH) && $(CTL) auth signup
	cd $(CODE_PATH) && $(CTL) auth token
	cd $(CODE_PATH) && $(CTL) auth whoami

	cd $(CODE_PATH) && $(CTL) init --builtin $(APP_BUILTIN) --name $(APP_NAME) --org $(APP_ORG) --port $(APP_PORT)

fly-deploy:
	cd $(CODE_PATH) && $(CTL) deploy
fly-destroy:
	cd $(CODE_PATH) && $(CTL) destroy $(APP_NAME)

fly-open:
	cd $(CODE_PATH) && $(CTL) open

fly-status:
	

	@echo -- STATUS --
	cd $(CODE_PATH) && $(CTL) status --watch
	#cd $(CODE_PATH) && $(CTL) ips list

fly-info:
	cd $(CODE_PATH) && $(CTL) info

	@echo -- CERTS --
	# flyctl certs check hello.getcourage.org
	cd $(CODE_PATH) && $(CTL) certs check $(DNS_SUBDOMAIN).$(DNS_DOMAIN)

	@echo -- RELEASES --
	# release history
	cd $(CODE_PATH) && $(CTL) releases

fly-log:
	cd $(CODE_PATH) && $(CTL) logs


fly-cert:
	# flyctl certs check $(DNS_SUBDOMAIN).$(DNS_DOMAIN) to get instructions.
	cd $(CODE_PATH) && $(CTL) certs add $(DNS_SUBDOMAIN).$(DNS_DOMAIN)


fly-secrets:
	cd $(CODE_PATH) && $(CTL) secrets set BANKPASSWORD="M0M0NEY"
	cd $(CODE_PATH) && $(CTL) secrets list

fly-volume:
	cd $(CODE_PATH) && $(CTL) volumes list
	#flyctl volumes create <name> --region ewr --size 1


	
	



