# Orchestration

A monorepo for messing around with the deployment of microservices to Kubernetes

## Setup

### Development

The local development environment uses the [Docker for Mac Kubernetes integration](https://docs.docker.com/docker-for-mac/#kubernetes). Minikube is not supported as it does not support LoadBalancer resources.

You'll also need [kubetpl](https://github.com/shyiko/kubetpl) as this is used for Kubernetes config templating during deployment.

## Scripts

* `make deploy`: Deploy each service into the Kubernetes cluster
