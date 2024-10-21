# App Of Apps

App of Apps for installing v2 of the ChatBot Application

## Prereqs

Openshift Cluster with access to Openshift AI, GPUs and setup using [this repo](https://gitlab.consulting.redhat.com/redprojectai/infrastructure/day2-operations).

## Environment Setup

### Create Huggingface Key

Future plans involve the use of 

Create AI Keys Secret:

```sh
export HUGGINGFACE_KEY=<key value>
oc create secret generic ai-keys --from-literal=huggingface_aikey=$HUGGINGFACE_KEY
```

### Create Storage

Create a DataConnection for a bucket containing the model

```yaml
kind: Secret
apiVersion: v1
metadata:
  name: storage-config
  labels:
    opendatahub.io/managed: 'true'
data:
  aws-connection-o-fish-bucket: xxxxxx
type: Opaque
```

### Create DSPA Storage Config (for some reason look into)

> Note: A bunch of other info is hardcoded into the code itself, it should probably all be read from a secret

```yaml
kind: Secret
apiVersion: v1
metadata:
  name: dspa-storage-config
data:
  AWS_ACCESS_KEY_ID: xxxx
  AWS_SECRET_ACCESS_KEY: xxxxx
type: Opaque  
```