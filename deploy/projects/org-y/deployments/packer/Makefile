#!/usr/bin/make -f

SHELL := /bin/sh
.SHELLFLAGS := -eu -c

PACKER := $(shell command -v packer 2>/dev/null)

WORK_DIR := ./
CACHE_DIR := ./packer_cache/
HCLOUD_OUT := ./dist/hcloud/maintemplatev2.log

.PHONY: all build-hcloud
all: clean build-hcloud

build-hcloud: $(HCLOUD_OUT)

$(HCLOUD_OUT):
	mkdir -p '$(dir $(HCLOUD_OUT))'
	'$(PACKER)' build -force -only=hcloud.main '$(WORK_DIR)' 2>&1 | tee '$(HCLOUD_OUT)'

.PHONY: clean
clean:
	rm -rf '$(HCLOUD_OUT)' '$(CACHE_DIR)'
