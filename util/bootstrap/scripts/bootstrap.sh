echo "Bootstraping namespace..."

# Create Weaviate Secret if it does not exist
if oc get secret weaviate-api-key-secret >/dev/null 2>&1; then
  echo "Secret 'weaviate-api-key-secret' already exists"
else
  # Create the secret
  oc create secret generic weaviate-api-key-secret \
    --from-literal=AUTHENTICATION_APIKEY_ALLOWED_KEYS="$(head -c 32 /dev/urandom | base64)"
  echo "Secret 'weaviate-api-key-secret' created"
fi