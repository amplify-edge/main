#!/usr/bin/env bash

KRNAME=projects/${GCP_PROJECT}/locations/${GKE_KEYRING_ZONE}/keyRings/${GKE_KEYRING_NAME}
KNAME="$KRNAME"/cryptoKeys/"$GKE_KEYNAME"
KEYRING_EXISTS=$(gcloud kms keyrings list --location "$GKE_KEYRING_ZONE" | grep "$KRNAME")
KEYNAME_EXISTS=$(gcloud kms keys list --keyring "$GKE_KEYRING_NAME" --location "$GKE_KEYRING_ZONE" | grep "$KNAME")

if [ "$KEYRING_EXISTS" = "" ]; then
    	gcloud kms keyrings create "${GKE_KEYRING_NAME}" \
    	  --location "${GKE_KEYRING_ZONE}" --project "${GCP_PROJECT}"
fi

if [ "$KEYNAME_EXISTS" = "" ]; then
	gcloud kms keys create "${GKE_KEYNAME}" --keyring "${GKE_KEYRING_NAME}"  \
		--location "${GKE_KEYRING_ZONE}" --project "${GCP_PROJECT}" --purpose encryption
	gcloud kms keys add-iam-policy-binding "${GKE_KEYNAME}" \
	  	--location "${GKE_KEYRING_ZONE}" --keyring "${GKE_KEYRING_NAME}" \
	  	--member serviceAccount:"${GCP_PROJECT}"-sa@"${GCP_PROJECT}".iam.gserviceaccount.com \
	  	--role roles/cloudkms.cryptoKeyEncrypterDecrypter \
	  	--project "${GCP_PROJECT}"
fi

