## Orchestration

A monorepo for messing around with the deployment of microservices to Kubernetes

## hello-node

### Scripts
* `yarn create`: Build the Docker image, create a Kubernetes deployment, expose it outside the cluster and open the service in a browser
* `yarn deploy`: Build the Docker image, update the Kubernetes deployment with the new image and open the service in a browser
* `yarn deploy:version`: Deploy a specific version of the app
