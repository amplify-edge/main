
## Server for main template

Install the gcloud tool:

- windows: https://cloud.google.com/sdk/docs/quickstart-windows
- mac: https://cloud.google.com/sdk/docs/quickstart-macos
- linux: https://cloud.google.com/sdk/docs/quickstart-linux


### GCP
Enable Kubernetes Engine API for your GCP project.
```
GCP_USER=<your GCP username> GCP_PROJECT=<your GCP project> make gke-setup
```
Then run this command to create your cluster:
```
GCP_USER=<your GCP username> GCP_PROJECT=<your GCP project> make gke-create
```
If you want to specify GCP zone and region, you can provide them as environment variables too:
```
GCP_ZONE=<GCP zone> GCP_REGION=<GCP region> GCP_USER=<your GCP username> GCP_PROJECT=<your GCP project> make gke-setup
```
Now you can get github action variables for your cluster:
```
GCP_USER=<your GCP username> GCP_PROJECT=<your GCP project> make gke-vars
```
or if you have specified zone and region:
```
GCP_ZONE=<GCP zone> GCP_REGION=<GCP region> GCP_USER=<your GCP username> GCP_PROJECT=<your GCP project> make gke-vars
```
Add provided variables as secrets to your github project. Github action will use these variables to deploy your project on GKE cluster and your project will be available on GKE_IP.


# Server for main template

http://34.89.133.90/#/

# GCP
Set up secrets in your workspace: GKE_PROJECT with the name of the project, GKE_EMAIL with the service account email, GKE_KEY with the Base64 encoded JSON service account key (https://github.com/GoogleCloudPlatform/github-actions/tree/docs/service-account-key/setup-gcloud#inputs).
Afteer deployment use kubectl port-forward:


### Minikube

#### Prequisites
1. Clone and setup https://github.com/getcouragenow/bootstrap
2. Choose your OS and configure it there (on OS folder)
3. Run prequisites install script ```make install-prequisites```
4. Log out / Reboot for Linux
4. Run ```make minikube-config```

#### First time setup
1. Edit provided ```ENV``` file 
2. Run ```make source-env``` to source environment variable from profile to shell.
3. Log out, to make sure the profile is loaded.
4. Run ```make gen-app-secrets```, your secrets will be generated in maintemplate/server/keys directory.
5. Go to local-ssl dir and run ```make install-certs``` to install locally signed certificates.
6. Run ```make minikube-start``` to start minikube registry
7. Run ```eval $(minikube -p minikube docker-env)``` or put that in your shell's config
8. Finally run ```make minikube-deploy``` to deploy. Run ```kubectl get all``` and your maintemplate and flutter app should be on minikube now.
8. Run ```kubectl get ingress``` that's where your maintemplate is.

### Redeploying
1. Run ```make minikube-clean-builds```
2. Redeploy using ```make minikube-deploy```

#### TODO
1. Helm charts for minio and envoy's persistent volume claim.
2. Kubectl patch (on runtime) for when issues like random helm error occurs.
3. Adding generated secrets to environment variables.
3. Docker rebuilds when inotify events occur.
4. TODO: Per developer ENV
