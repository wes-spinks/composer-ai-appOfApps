# Composer AI Gitops

## Description

GitOps repository responsible for installing components used for Composer AI

## Installation

### Prerequisites

- Requires OpenShift cluster of version 4.16 or above

### Install Cluster Level Components (Recommended)

Using the `bootstrap` script located in the [Cluster Gitops](https://github.com/redhat-composer-ai/cluster-gitops) repository will install all the required components as well as all the Composer AI Components located in this repository.

### Install Directly

If you already have an existing cluster that contains all the required cluster level operators the application can be installed by installing the helm chart located in `appOfApps`:

```sh
helm install composerAiConfig ./appOfApps
```

> [!NOTE]  
> Change `clusterDomain` and `repo` information in the `values.yaml` file if required.
