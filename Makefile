
SHARED_FSPATH=./../shared
BOILERPLATE_FSPATH=$(SHARED_FSPATH)/boilerplate

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/gitr.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/grpc.mk
include $(BOILERPLATE_FSPATH)/flu.mk
include $(BOILERPLATE_FSPATH)/go.mk



# For deploy to linux
GOOS=linux
GOARCH=amd64

# For dev
GOOS=darwin
GOARCH=amd64

# brew cask install google-cloud-sdk
GCLOUD_PROJECT_ID=v2-ci-getcouragenow-org

gcloud-print:
	#gcloud auth login
	gcloud config set project $(GCLOUD_PROJECT_ID)
	gcloud iam service-accounts list --project $(GCLOUD_PROJECT_ID)
	gcloud run services list --platform managed
	gcloud compute instances list
	gcloud container images list --repository
gcloud-key:
	# makes the key 
	gcloud iam service-accounts keys \
       create ~/my_awesome_secret_key.json \
       --iam-account 519128392337-compute@developer.gserviceaccount.com \
       --project $(GCLOUD_PROJECT_ID)
gcloud-key-encode:
	# encodes the key and uplaods to github
	cat ~/my_awesome_secret_key.json | base64 | pbcopy
	open https://github.com/organizations/getcouragenow/settings/secrets
	#- GCP_KEY: paste in encoded key





this-all: this-print this-dep this-build this-print-end

this-print: 
	@echo
	@echo "-- SYS: start --"
	@echo SDK_BIN: $(SDK_BIN)
	@echo

this-print-end:
	@echo
	@echo "-- SYS: end --"
	@echo
	@echo

this-print-all:
	
	$(MAKE) os-print
	
	$(MAKE) gitr-print
	
	$(MAKE) flu-print

	$(MAKE) flu-gen-lang-print

	$(MAKE) go-print

this-dep:
	cd $(SHARED_FSPATH) && $(MAKE) this-all

V2_BUILD=./deploy/templates/maintemplatev2
this-build: v2 v3

v2:
	# Does full gen and build (web)
	cd $(V2_BUILD) && $(MAKE) this-all

v2-server-open:
	cd $(V2_BUILD) && $(MAKE) this-server-open

v2-server-run:
	cd $(V2_BUILD) && $(MAKE) this-server-run

v2-flu-web-run:
	cd $(V2_BUILD) && $(MAKE) this-flu-web-run

v2-flu-desk-run:
	cd $(V2_BUILD) && $(MAKE) this-flu-desk-run

v2-sdk-auth-signup:
	cd $(V2_BUILD) && $(MAKE) this-sdk-auth-signup

v2-sdk-auth-signin:
	cd $(V2_BUILD) && $(MAKE) this-sdk-auth-signin

v2-sdk-accounts-list:
	cd $(V2_BUILD) && $(MAKE) this-sdk-accounts-list

v3:
	# Does full gen and build (web)
	cd ./deploy/templates/maintemplatev3 && $(MAKE) this-all

v3-sys-server-run:
	cd ./deploy/templates/maintemplatev3 && $(MAKE) this-sys-server-run
	
v3-mod-server-run:
	cd ./deploy/templates/maintemplatev3 && $(MAKE) this-mod-server-run

v3-sys-sdk-auth-signup:
	cd ./deploy/templates/maintemplatev3 && $(MAKE) this-sys-sdk-auth-signup

v3-sys-sdk-auth-signin:
	cd ./deploy/templates/maintemplatev3 && $(MAKE) this-sys-sdk-auth-signin

v3-sys-sdk-accounts-list:
	cd ./deploy/templates/maintemplatev3 && $(MAKE) this-sys-sdk-accounts-list

v3-mod-sdk-get:
	cd ./deploy/templates/maintemplatev3 && $(MAKE) this-mod-sdk-get

### For Local dev. Does NOT do big Gen !
v3-flu-web-run:
	cd ./deploy/templates/maintemplatev3 && $(MAKE) flu-web-run
