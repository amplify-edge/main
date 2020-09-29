#!/usr/bin/env bash

cfssl gencert -ca=ca.pem -ca-key=ca-key.pem \
	--config=maintemplate/maintemplate-sign-conf.json \
	-profile=kubernetes maintemplate/maintemplate-sign-conf.json | cfssljson -bare maintemplate-svc

cp maintemplate/maintemplate-csr.yaml maintemplate-csr-real.yaml
B64_DECODED=$(awk '1' maintemplate-svc.csr | base64 | tr -d '\n')
perl -i -pe "s@b64_here@$B64_DECODED@g" maintemplate-csr-real.yaml