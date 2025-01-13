#!/bin/sh

SECRET_NAME=${SECRET_NAME:-"elasticsearch-es-elastic-user"}
SECRET_NAMESPACE=${SECRET_NAMESPACE:-"composer-ai-apps"}
SECRET_KEY=${SECRET_KEY:-"elastic"}
SECRET_VALUE=${SECRET_VALUE:-"REPLACE_ME"}


if [[ $(oc get secret ${SECRET_NAME} -n ${SECRET_NAMESPACE} -o name --ignore-not-found) ]]; then
    echo "Secret already exists.  Skipping creation."
else
    echo "Creating secret ${SECRET_NAME} in ${SECRET_NAMESPACE}"
    oc create secret generic ${SECRET_NAME} -n ${SECRET_NAMESPACE} --from-literal=${SECRET_KEY}=${SECRET_VALUE}
fi
