

GO_OS 		:= $(shell go env GOOS)
GO_ARCH		:= $(shell go env GOARCH)


# Signing
AND_KEYSTORE_APP_NAME=main
AND_KEYSTORE_FSPATH=$(PWD)/_keys/$(AND_KEYSTORE_APP_NAME)

# Absolute File path to Server
current_dir = $(shell pwd)
SERVER_FSPATH=$(current_dir)/../server

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)


print: ## print

	@echo
	@echo GO_OS: $(GO_OS)
	@echo GO_OS: $(GO_ARCH)
	@echo

	@echo
	@echo current_dir: $(current_dir)
	@echo SERVER_FSPATH: $(SERVER_FSPATH)
	@echo


	@echo
	@echo SIGNING --
	@echo AND_KEYSTORE_APP_NAME: $(AND_KEYSTORE_APP_NAME)
	@echo AND_KEYSTORE_FSPATH: $(AND_KEYSTORE_FSPATH)
	@echo


### FLU

flu-config: ## flu-config
	flutter config
	flutter doctor -v
	flutter devices

flu-config-desk: ## flu-config-desk
	hover -h

flu-clean:
	flutter clean
flu-update:
	flutter packages get
	$(MAKE) gen-icons
	$(MAKE) gen-hive
	$(MAKE) gen-proto
	flutter analyze 


### GEN 

gen-icons:
	# mobile and web
	@echo
	@echo Generating icons for Flutter
	@echo
	cd $(PWD) && flutter pub run flutter_launcher_icons:main

	# desktop
	@echo
	@echo Copying icon-png from flutter assets into go assets, so hover can use it
	@echo
	# comment out until we add go-flutter
	#cp $(PWD)/assets/icon/icon.png $(PWD)/go/assets

gen-hive:
	cd $(PWD) && flutter packages pub run build_runner build --delete-conflicting-outputs

gen-proto:
	pub global activate protoc_plugin
	mkdir -p $(PWD)/lib/api/v1/google/protobuf

ifeq ($(GO_OS), windows)
	@echo Windows detected
	protoc empty.proto timestamp.proto wrappers.proto --proto_path=$(LIB_FSPATH)/server/third_party/google/protobuf/ --plugin=$(HOME_PATH)/AppData/Roaming/Pub/Cache/bin/protoc-gen-dart.bat --dart_out=grpc:"$(PROTO_OUTPUT)/client/lib/chat_view/api/v1/google/protobuf"
	protoc chat.proto --proto_path=$(LIB_FSPATH)/server/api/proto/v1/ --plugin=$(HOME_PATH)/AppData/Roaming/Pub/Cache/bin/protoc-gen-dart.bat --dart_out=grpc:"$(PROTO_OUTPUT)/client/lib/chat_view/api/v1/"
else
	protoc empty.proto timestamp.proto wrappers.proto --proto_path=$(LIB_FSPATH)/server/third_party/google/protobuf --plugin=protoc-gen-dart=$(HOME)/.pub-cache/bin/protoc-gen-dart --dart_out=grpc:$(PWD)/lib/api/v1/google/protobuf
	protoc chat.proto --proto_path=$(LIB_FSPATH)/server/api/proto/v1/ --plugin=protoc-gen-dart=$(HOME)/.pub-cache/bin/protoc-gen-dart --dart_out=grpc:$(PWD)/client/lib/chat_view/api/v1/
endif

GSHEET_FSPATH=$(PWD)/../../bootstrap/tool/googlesheet
gen-mockdata:
	#cd $(GSHEET_FSPATH) && $(MAKE) local-run-datadump
	cp -r $(GSHEET_FSPATH)/outputs/datadump/json ./assets/mockData2



### DESK

flu-desk-local-run: ## flu-desk-local-run
	cd $($(PWD)) && hover run

flu-desk-local-build: ## flu-desk-local-build

ifeq ($(GO_OS), linux)
	@echo Linux detected

	cd $($(PWD)) && hover build $(GO_OS)-appimage --version-number $(GIT_VERSION)
	cd $($(PWD)) && hover build $(GO_OS)-deb --version-number $(GIT_VERSION)
	cd $($(PWD)) && hover build $(GO_OS)-rpm --version-number $(GIT_VERSION)
	cd $($(PWD)) && hover build $(GO_OS)-snap --version-number $(GIT_VERSION)

endif

ifeq ($(GO_OS), darwin)
	@echo Mac detected

	#cd $($(PWD)) && hover build $(GO_OS)-bundle --version-number $(GIT_VERSION)
	#cd $($(PWD)) && hover build $(GO_OS) --version-number $(GIT_VERSION)
	cd $($(PWD)) && hover build $(GO_OS)-pkg --version-number $(GIT_VERSION)
	#cd $($(PWD)) && hover build $(GO_OS)-dmg --version-number $(GIT_VERSION)

endif

ifeq ($(GO_OS), windows)
	@echo Windows detected
	cd $($(PWD)) && hover build $(GO_OS) --version-number $(GIT_VERSION)
	cd $($(PWD)) && hover build $(GO_OS)-msi --version-number $(GIT_VERSION)
endif

	

flu-desk-build-all: ## flu-desk-build-all
	$(MAKE) flu-desk-build-clean
	$(MAKE) flu-desk-build-init
	$(MAKE) flu-desk-build

flu-desk-build-init: 
	cd $($(PWD)) && hover init $(LIB)/$(SAMPLE_NAME)

flu-desk-build-clean:
	rm -rf $($(PWD))/go
	docker system prune


flu-desk-build:
	# uses docker to build

	cd $($(PWD)) && hover build darwin --version-number $(GIT_VERSION)
	cd $($(PWD)) && hover build windows --version-number $(GIT_VERSION)
	# broken: need to look into
	#cd $($(PWD)) && hover build linux --version-number $(GIT_VERSION)

flu-desk-buildrun: flu-desk-build

	# darwin
	open $($(PWD))/go/build/outputs/darwin/
	open $($(PWD))/go/build/outputs/darwin/$(SAMPLE)

### Desk Packaging

flu-desk-pack-all: ## flu-desk-pack-all
	$(MAKE) flu-desk-pack-clean
	$(MAKE) flu-desk-pack-init
	$(MAKE) flu-desk-pack

flu-desk-pack-clean:
	rm -rf $($(PWD))/go/packaging

	# this wipes ALL of docker data
	docker system prune
	#docker system prune --force




flu-desk-pack-init:

	# Creates any files needed to do packaging.
	# Only needed once.

	# hover init-packaging --help

	#darwin
	cd $($(PWD)) && hover init-packaging darwin-bundle
	cd $($(PWD)) && hover init-packaging darwin-pkg

	# windows
	cd $($(PWD)) && hover init-packaging windows-msi

	# linux
	cd $($(PWD)) && hover init-packaging linux-appimage
	cd $($(PWD)) && hover init-packaging linux-deb
	cd $($(PWD)) && hover init-packaging linux-snap


flu-desk-pack:


	# NOTE: Mac devs: # For docker builds on MAC you need to add "/var/folders/wp/" to your docker file sharing.
	# hover build --help


	# darwin (works)
	cd $($(PWD)) && hover build darwin-pkg --version-number $(GIT_VERSION)
	
	# windows (works)
	#cd $($(PWD)) && hover build windows-msi

	# linux 
	# works
	#cd $($(PWD)) && hover build linux-deb

	# broken: Issue: https://github.com/go-flutter-desktop/go-flutter/issues/287#issuecomment-544161253
	# marked as "will not fix" because its shitty Ubuntu SnapCraft error.
	# It seems that linux-appimage (https://appimage.org/) works on ubuntu so screw SnapCraft..
	# to install on ubuntu using a appimage is easy: https://askubuntu.com/questions/774490/what-is-an-appimage-how-do-i-install-it
	# We need to try and make sure it works with flutter ! Who has an ubuntu laptop ?

	# Update: works for basic go-flutter example
	#cd $($(PWD)) && hover build linux-snap

	# broken: Issue: https://github.com/go-flutter-desktop/go-flutter/issues/289
	# Marked "as wont fix". So have to ask AppImage team.

	# Update: works for basic go-flutter example
	#cd $($(PWD)) && hover build linux-appimage
	
flu-desk-pack-open:
	# to see the outputs in your file system.
	open $($(PWD))/go/build/outputs


# Will vary per run and machine.
DOCKERTEMP_FSPATH=/var/folders/wp/ff6sz9qs6g71jnm12nj2kbyw0000gp

flu-desk-pack-tmp-list:
	ls /var/folders/wp/
	stat $(DOCKERTEMP_FSPATH)

flu-desk-pack-tmp-clean:
	# clean out docker tmp file dir
	rm -rf $(DOCKERTEMP_FSPATH)

	#ls /var/folders/wp/
	#cd /var/folders/wp/ && rm -rf *
	#ls /var/folders/wp/

flu-desk-pack-tmp-zip:
	# to share whats in tmp
	cd $(DOCKERTEMP_FSPATH) && zip -r -X $($(PWD))/go/build/outputs/dockertemp.zip *




### Desk Zipping

flu-desk-dist-all: ## flu-desk-dist-all
	$(MAKE) flu-desk-dist-clean
	$(MAKE) flu-desk-dist-zip
	$(MAKE) flu-desk-dist-unzip

flu-desk-dist-clean:
	rm -rf $($(PWD))/dist
	mkdir -p $($(PWD))/dist

flu-desk-dist-zip:
	# zip build by OS.

	# darwin
	cd $($(PWD))/go/build/outputs/darwin && zip -r -X $($(PWD))/dist/darwin.zip *

	# windows
	cd $($(PWD))/go/build/outputs/windows && zip -r -X $($(PWD))/dist/windows.zip *
	
	# linux
	cd $($(PWD))/go/build/outputs/linux && zip -r -X $($(PWD))/dist/linux.zip *
	

flu-desk-dist-unzip:
	# clean dist
	rm -rf $($(PWD))/dist/out
	mkdir -p $($(PWD))/dist/out


	# darwin
	unzip $($(PWD))/dist/darwin.zip -d $($(PWD))/dist/out/darwin

	# windows
	unzip $($(PWD))/dist/windows.zip -d $($(PWD))/dist/out/windows
	
	# linux
	unzip $($(PWD))/dist/linux.zip -d $($(PWD))/dist/out/linux

	

### Mob

flu-mob-run: ## flu-mob-run
	flutter run -d all

flu-mob-release-and-init: ## flu-mob-release-and-init

	mkdir -p $(AND_KEYSTORE_FSPATH)

	# open keystore
	#code $(AND_KEYSTORE_MAC_FSPATH)

	# Create keystore
	# Warning: Keep the keystore file private; do not check it into public source control.
	# Cannot overwrite existing....
	keytool -genkey -v -keystore $(AND_KEYSTORE_FSPATH)/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key

	# windows is a littel diff
	# keytool -genkey -v -keystore $(AND_KEYSTORE_FSPATH)/key.jks -keyalg RSA -storetype JKS -keysize 2048 -validity 10000 -alias key

flu-mob-release-and-gen: ## flu-mob-release-and-gen

	# https://flutter.dev/docs/deployment/android
	
	touch $(PWD)/android/key.properties
	code $(PWD)/android/key.properties
	# TODO gen this
	#- add the 4 lines

	touch $(PWD)/android/app/proguard-rules.pro 
	code $(PWD)/android/app/proguard-rules.pro 
	# TODO gen this
	# - add a few lines

	touch $(PWD)/android/app/build.gradle
	code $(PWD)/android/app/build.gradle
	# TODO: gen this
	# - add a few lines, etc etc
	# - add ref to proguard

	# Build it
	cd $(PWD) && flutter build appbundle

	# Create an account on Google Play Store
	# https://play.google.com/apps/publish/?account=7105100900922845210

	# DO BETA RELEASE: https://play.google.com/apps/publish/?account=7105100900922845210#PrepareReleasePlace:p=tmp.05109091238716120360.1538517246276.1913796864&appid=4972552978345084231&releaseTrackId=4699993911531051870&releaseId=4701866095568168106
	# Just uplaod the "build/app/outputs/bundle/release/app.aab"

	## TODO: https://play.google.com/apps/publish/?account=7105100900922845210#MarketListingPlace:p=com.winwisely.whitelabel&appid=4972552978345084231
	# all the screenshots!!


flu-mob-release-ios-gen: ## flu-mob-release-ios-gen

	# TODO: This needs to be done.




### WEB

flu-web-config:
	# flutter channel ?
	#flutter channel dev
	#flutter upgrade

	flutter config --enable-web
	# turn off any desktop
	flutter config --no-enable-linux-desktop
	flutter config --no-enable-macos-desktop
	flutter config --no-enable-windows-desktop

flu-web-create: flu-web-config
	# works 
	# make sure using new dir.
	mkdir -p $(PWD)
	cd $(PWD) && flutter create --web .
flu-web-run: flu-web-config ## flu-web-run
	# works
	# Reload works too :)
	cd $(PWD) && flutter run -d chrome
flu-web-build: flu-web-config ## flu-web-build
	# works :)
	cd $(PWD) && flutter build web --release
flu-web-test: flu-web-config ## flu-web-test
	# works :)
	cd $(PWD) && flutter test --platform=chrome