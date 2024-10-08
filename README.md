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
