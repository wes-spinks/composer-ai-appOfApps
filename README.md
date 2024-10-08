# App Of Apps v2

App of Apps for installing v2 of the ChatBot Application

## Prereqs

Openshift Cluster with access to Openshift AI, GPUs and setup using [this repo](https://gitlab.consulting.redhat.com/redprojectai/infrastructure/day2-operations).

## Environment Setup

### ChatBot

```sh
TODO: CREATE DEFAULT WEAVIATE CONNECTIONS INFO

TODO: CREATE DEFAULT vLLM CONNECTION INFO
```

### Data Ingestion

Create Weaviate Secret

```sh
export WEAVIATE_API_KEY=$(openssl rand -base64 32)

cat <<EOF | oc apply -f -
kind: Secret
apiVersion: v1
metadata:
  name: weaviate-api-key-secret
data:
  AUTHENTICATION_APIKEY_ALLOWED_KEYS: ${WEAVIATE_API_KEY}
type: Opaque



oc create secret generic weaviate-api-key-secret \
--from-literal=AUTHENTICATION_APIKEY_ALLOWED_KEYS="${WEAVIATE_API_KEY}"

```

Create Data Connection in Data Science

TODO: Creating Data Science Connection

# AppDeploy

Create the application in the developer-gitops instance of ArgoCD:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: composer-ai-app-of-apps
  label:
    app.kubernetes.io/name: app-of-apps
    app.kubernetes.io/instance-of: composer-ai
    app.kubernetes.io/managed-by: ArgoCD
  namespace: openshift-gitops
spec:
  destination:
    server: 'https://kubernetes.default.svc'
  source:
    path: appOfApps #Replace this with the correct cluster
    repoURL: 'https://gitlab.consulting.redhat.com/redprojectai/infrastructure/appdeploy-v2.git' #Replace this with your forked cluster
    targetRevision: HEAD
    helm:
      parameters:
        - name: application.defaultNamespace
          value: <TARGET_NAMESPACE>
  project: default
  syncPolicy:
    automated:
      prune: false
      selfHeal: false
```
