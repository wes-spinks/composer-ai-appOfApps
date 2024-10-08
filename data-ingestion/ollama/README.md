# Ollama Deployment

This chart creates an `ServingRuntime` and `InferenceService` inside of a namespace, mocking what the Openshift AI does.

Note that the Model Serve will show up in the Openshift AI gui, but it will have an "Unknown" runtime since it was created through Openshift/Gitops.

## Important Notes

If the ServingRuntime changes the `serving.knative.dev/v1` `Service` will need to be deleted. Once it is the `InferenceService` should automatically recreate with the correct values.

Cause we are serving stuff serverlessly it may take a minute or two before the local model appears.

In order to get the Ollama deployment working, you need to create a Data Connection in OpenShift AI through the following steps:

1. Open the Red Hat OpenShift AI interface from the cluster using the grid icon in the top right. 
2. Open `Data Science Projects` on the sidebar.
3. Go to `Data connections` and click on `Add data connection`. Set the parameters as needed based on your region and bucket. Remember the data connection's name! 
4. Return to the OpenShift cluster and create a new key-value secret named `storage-config`. This secret should have a key named after the data connection, and a value based on the following template: 

```{"access_key_id":"<access key>","bucket":"<bucket>","default_bucket":"<default>","endpoint_url":"<endpoint>","region":"<region>","secret_access_key":"<secret key>","type":"s3"}```

5. Create a second key-value secret named after the data connection. It should have the following key-value pairs: 

```
AWS_ACCESS_KEY_ID: <access key>
AWS_DEFAULT_REGION: <region>
AWS_S3_BUCKET: <bucket>
AWS_S3_ENDPOINT: <endpoint>
AWS_SECRET_ACCESS_KEY: <secret key>
```

Note: The ollama values.yaml in the Helm Chart should have a storage.name value equivalent to the data connection's name in order to properly detect the storage secret. 
