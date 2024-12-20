# Weaviate Deployment

Helm chart for deploying a Weaviate instance

## Data Ingestion Validation

Included in this chart is a `validation.sh` script that can be run locally if you are connected to the cluster to check which Weaviate indexes are available.

> [!NOTE]  
> Usage: `./validation.sh -n <NAMESPACE>` (uses composer-ai by default)
