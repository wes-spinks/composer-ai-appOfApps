

source "$(dirname "$0")/functions.sh"
source "$(dirname "$0")/util.sh"
source "$(dirname "$0")/command_flags.sh" "$@"

# Check if NAMESPACE is provided
if [ -z "$NAMESPACE" ]; then
  echo "Namespace is required, either set NAMESPACE env or pass --namespace="
  exit 1
fi



# Create Weaviate Secret if it does not exist
if oc get secret weaviate-api-key-secret -n $NAMESPACE >/dev/null 2>&1; then
  echo "Secret 'weaviate-api-key-secret' already exists in namespace $NAMESPACE"
else
  # Create the secret
  oc create secret generic weaviate-api-key-secret \
  --from-literal=AUTHENTICATION_APIKEY_ALLOWED_KEYS="${WEAVIATE_API_KEY} -n $NAMESPACE"
  echo "Secret 'weaviate-api-key-secret' created in namespace $NAMESPACE"
fi

exit 0