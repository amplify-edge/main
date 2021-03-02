# Download Booty
BOOTY_URL := https://raw.githubusercontent.com/amplify-edge/booty/master/scripts

ifeq ($(OS),Windows_NT)
	BOOTY_URL:=$(BOOTY_URL)/install.ps1
else
	BOOTY_URL:=$(BOOTY_URL)/install.sh
endif

SHELLCMD :=
ADD_PATH :=
ifeq ($(OS),Windows_NT)
	SHELLCMD:=powershell -NoLogo -Sta -NoProfile -NonInteractive -ExecutionPolicy Unrestricted -Command "Invoke-WebRequest -useb $(BOOTY_URL) | Invoke-Expression"
	ADD_PATH:=export PATH=$$PATH:"/C/booty" # workaround for github CI
else
	SHELLCMD:=curl -fsSL $(BOOTY_URL) | bash
	ADD_PATH:=echo $$PATH
endif

# brew cask install google-cloud-sdk
GCLOUD_PROJECT_ID=v2-ci-amplify-cms-org

#gcloud-print:
#	#gcloud auth login
#	gcloud config set project $(GCLOUD_PROJECT_ID)
#	gcloud iam service-accounts list --project $(GCLOUD_PROJECT_ID)
#	gcloud run services list --platform managed
#	gcloud compute instances list
#	gcloud container images list --repository
#
#gcloud-key:
#	# makes the key
#	gcloud iam service-accounts keys \
#       create ~/my_awesome_secret_key.json \
#       --iam-account 519128392337-compute@developer.gserviceaccount.com \
#       --project $(GCLOUD_PROJECT_ID)
#
#gcloud-key-encode:
#	# encodes the key and uplaods to github
#	cat ~/my_awesome_secret_key.json | base64 | pbcopy
#	open https://github.com/organizations/amplify-cms/settings/secrets
#	#- GCP_KEY: paste in encoded key


# TODO: fix dependency installations
#all: os-print print dep build print-end
all: print dep build print-end

print:
	@echo
	@echo "-- MAIN: start --"
	@echo SDK_BIN: $(SDK_BIN)
	@echo

print-end:
	@echo
	@echo "-- MAIN: end --"
	@echo
	@echo

dep:
	$(SHELLCMD)
	$(ADD_PATH)
	@booty install-all
	@booty extract includes

V2_BUILD=./deploy/templates/maintemplatev2
# TODO: fix v3
#build: v2 v3
build: v2

v2:
	# Does full gen and build (web)
	cd $(V2_BUILD) && $(MAKE) all

v2-server-open:
	cd $(V2_BUILD) && $(MAKE) server-open

v2-server-run:
	cd $(V2_BUILD) && $(MAKE) server-run

v2-flu-web-run:
	cd $(V2_BUILD) && $(MAKE) flu-web-run

v2-flu-desk-run:
	cd $(V2_BUILD) && $(MAKE) flu-desk-run

v2-sdk-auth-signup:
	cd $(V2_BUILD) && $(MAKE) sdk-auth-signup

v2-sdk-auth-signin:
	cd $(V2_BUILD) && $(MAKE) sdk-auth-signin

v2-sdk-accounts-list:
	cd $(V2_BUILD) && $(MAKE) sdk-accounts-list

v3:
	# Does full gen and build (web)
	cd ./deploy/templates/maintemplatev3 && $(MAKE) all

v3-sys-server-run:
	cd ./deploy/templates/maintemplatev3 && $(MAKE) sys-server-run
	
v3-mod-server-run:
	cd ./deploy/templates/maintemplatev3 && $(MAKE) mod-server-run

v3-sys-sdk-auth-signup:
	cd ./deploy/templates/maintemplatev3 && $(MAKE) sys-sdk-auth-signup

v3-sys-sdk-auth-signin:
	cd ./deploy/templates/maintemplatev3 && $(MAKE) sys-sdk-auth-signin

v3-sys-sdk-accounts-list:
	cd ./deploy/templates/maintemplatev3 && $(MAKE) sys-sdk-accounts-list

v3-mod-sdk-get:
	cd ./deploy/templates/maintemplatev3 && $(MAKE) mod-sdk-get

### For Local dev. Does NOT do big Gen !
v3-flu-web-run:
	cd ./deploy/templates/maintemplatev3 && $(MAKE) flu-web-run
