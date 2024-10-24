while getopts "n:" opt; do
  case $opt in
    n) NAMESPACE=$OPTARG;;
    \?) echo "Invalid option -$OPTARG" >&2;;
  esac
done

if [ -z "$NAMESPACE" ]; then
  NAMESPACE=composer-ai-app
fi

# Rest of the code...


if [ -z "$NAMESPACE" ]; then
  NAMESPACE=composer-ai-app
fi

# Port forward the weaviate app
oc port-forward svc/weaviate-vector-db 55555:8080 -n $NAMESPACE &  # Run in the background

WEAVIATE_API_KEY=$(oc get secret weaviate-api-key-secret -n $NAMESPACE -o jsonpath='{.data.AUTHENTICATION_APIKEY_ALLOWED_KEYS}' | base64 --decode)

sleep 3 # Wait for the port forwarding to establish

# Print Available Weaviate Classes (i.e. collections)
response=$(curl -X GET "http://localhost:55555/v1/schema" -H "Authorization: Bearer $WEAVIATE_API_KEY" | jq '.')

echo -e "\e[1mAvailable Weaviate Indexes:\e[0m"
classes=$(echo "$response" | jq -r '.classes[].class')

for class in $classes; do
  echo -e "\e[30m$class\e[0m"
done


# Kill all existing port-forward processes
pkill -f "oc port-forward"