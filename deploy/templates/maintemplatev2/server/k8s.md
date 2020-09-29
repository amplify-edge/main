## GKE Cluster
This documention covers all the steps needed for running the project on a kubernetes cluster. For now, GKE cluster is assumed to be underlying K8S cluster.

- GKE Cluster
  - Create a Google Cloud Account
  - Select a Zone
  - Create a Project
  - Install Google Cloud SDK
  - Initialize Google Cloud SDK
  - Set kube config
  - IAM Roles for GKE
  - Enable Containers Engine
  - Service Account
  - Create a Kubernetes Cluster
  - Static IP
- Github Actions
- Ingress Controller
  - Nginx Ingress Controller
  - Static IP
- Tools
  - cert-manager
  - Helm
  - NATS
  - Envoy
  - Minio

### Create a Google Cloud Account
First things first, go to https://cloud.google.com/ to sign up for a Google Cloud account if you do not already have one. If you already have an account, sign in, otherwise click ‘Get Started for Free’ and create a new account. Sign in and go to console Home.

```
$ export GCP_EMAIL=winwisely000@gmail.com
```

### Select a Zone
A zone and a region must be selected for GKE cluster. You can use this documention for details:
[Regions and Zones](https://cloud.google.com/compute/docs/regions-zones).

No region/zone feature have used so you can just use the nearest one to your users or ```europe-west3-a``` for example.

```
$ export GKE_ZONE=europe-west3-a
$ export GKE_REGION=europe-west3
```

### Create a Project
If you do not have a project, click the drop down in the header toolbar and create a new project by clicking the ‘NEW PROJECT’ button.

Set your project name as an environment variable:
```
$ export GKE_PROJECT=getcouragenow
```
Set the project as your default project for gcloud:

```
$ gcloud config set project ${GCP_PROJECT}
```
### Install Google Cloud SDK
To access your new GKE cluster from your client, you need to install the gclouc cli that is included in the Google Cloud SDK.

Go to https://cloud.google.com/sdk and follow the instructions to install the SDK on your client platform, e.g. click the button for ‘INSTALL FOR MACOS’ if your client is a Mac OSX.

### Initialize Google Cloud SDK

```$ gcloud init
Welcome! This command will take you through the configuration of gcloud.
Settings from your current configuration [default] are:
compute:
  region: europe-west3
  zone: europe-west3-a
core:
  account: winwisely000@gmail.com
  disable_usage_reporting: 'True' 
  project: getcouragenow
Pick configuration to use:
[1] Re-initialize this configuration [default] with new settings
[2] Create a new configuration
Please enter your numeric choice:
```
Update Google Clouds SDK components,
```
$ gcloud components update
```

### Set kube config
By default, kubectl looks for a file named ‘config’ in the ‘~/.kube’ directory to access the API server of a cluster.

The ‘gcloud auth login’ command, obtains access credentials via a web-based authorization flow and sets the configuration.

To authenticate with Google Cloud SDK,
```
$ gcloud auth login
```
click the Allow button.

You can update an existing kube config file with the credentials of a specific cluster by running the following command,
```
$ gcloud container clusters get-credentials standard-cluster --zone $GKE_CLUSTER --project $GKE_ZONE
```

View your current-context,

```
$ kubectl config current-context
```

Your client is now connected to the remote cluster on GKE.

### IAM Roles for GKE
Use this command to set IAM roles to your account:
```
$ gcloud projects add-iam-policy-binding ${GCP_PROJECT} --member user:${GCP_EMAIL} --role roles/iam.serviceAccountKeyAdmin
```
This command grants service account creation permission to your account.

### Enable Containers Engine
Enable GCP containers engine using this command:
```
gcloud services enable container.googleapis.com
```

### Service Account
For administration of our GKE cluster we need a service account with related permission. First, create a service account:
```
$ gcloud iam service-accounts create ${GKE_PROJECT}-sa
```
To grant cluster administration permission to this new service account: 
```
gcloud projects add-iam-policy-binding ${GKE_PROJECT} --member serviceAccount:${GKE_PROJECT}-sa@${GKE_PROJECT}.iam.gserviceaccount.com --role roles/container.admin
```
Also we need storage administration role for our service account to be able to push to container registry which is needed in next steps:
```
gcloud projects add-iam-policy-binding ${GCP_PROJECT} --member serviceAccount:${GKE_PROJECT}-sa@${GKE_PROJECT}.iam.gserviceaccount.com --role roles/storage.admin
```
Now we can download the key of service account. Below commands make a directory in your home folder. You can change the directory. 
```
mkdir -p ~/.getcouragenow/
gcloud iam service-accounts keys create ~/.getcouragenow/${GKE_PROJECT}.json --iam-account ${GKE_PROJECT}-sa@${GKE_PROJECT}.iam.gserviceaccount.com
```

### Create a Kubernetes Cluster
Create Kubernetes cluster using below command which might take several minutes to finish:
```
gcloud container clusters create ${GKE_PROJECT} --zone ${GKE_ZONE} --enable-autoscaling
```

### Static IP
We will need a static IP in next steps:
```
$ gcloud compute addresses create ${GKE_PROJECT}-static-ip --region ${GKE_REGION}
```

## Github Actions
This section covers needed configurations for Github actions. You should set a few secrets on your Github account and Github actions will use them to deploy new releases on GKE cluster. To set these secrets, go to ```Settings``` tab on your Github project homepage, find ```Secrets``` pane and click on ```Add a new secret```.
Variables which you should provide are listed below:

- ```GKE_PROJECT```
- ```GKE_EMAIL```
- ```GKE_KEY```
- ```GKE_ZONE```

```GKE_PROJECT```: Is the name of your projevy. for example ```getcouragenow```

```GKE_EMAIL```: Is in this format: ```${GKE_PROJECT}-sa@${GKE_PROJECT}.iam.gserviceaccount.com```

```GKE_ZONE```: GCP Zone in which cluster is. For example: ```europe-west3-a```

For ```GKE_KEY``` use this command:
```
$ cat  ~/.getcouragenow/${GKE_PROJECT}.json | base64 -w0
```

## Ingress Controller
### Nginx Ingress Controller
To install Nginx controller on Kubernetes cluster:
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml
```
For GKE we need an additional step:
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/cloud-generic.yaml
```
### Static IP
Set the static IP to ingress-nginx serivce:
```
kubectl --namespace ingress-nginx patch svc ingress-nginx -p "{\"spec\": {\"loadBalancerIP\": \"$GKE_IP\"}}"
```

## Tools
We need some additional tools:
### cert-manager
Create a namespace to run cert-manager in:
```
$ kubectl create namespace cert-manager
```
Install the CustomResourceDefinitions and cert-manager itself:
```
$ kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.14.0/cert-manager.yaml
```
For RBAC:
```
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value core/account)
```
Also create a production issuer and deploy it. You will need to update this example and add in your own email address:
```
   apiVersion: cert-manager.io/v1alpha2
   kind: Issuer
   metadata:
     name: letsencrypt-prod
   spec:
     acme:
       # The ACME server URL
       server: https://acme-v02.api.letsencrypt.org/directory
       # Email address used for ACME registration
       email: user@example.com
       # Name of a secret used to store the ACME account private key
       privateKeySecretRef:
         name: letsencrypt-prod
       # Enable the HTTP-01 challenge provider
       solvers:
       - http01:
           ingress:
             class: nginx
```
```
kubectl create --edit -f https://cert-manager.io/docs/tutorials/acme/example/production-issuer.yaml
```

### Helm
Helm has an installer script that will automatically grab the latest version of Helm and install it locally.
```
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
```
