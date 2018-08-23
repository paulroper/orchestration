#!/usr/bin/env bash
set -e

export $(cat .env | xargs)

# elixir-magic build steps
cd ./elixir-magic && docker build . -t $ELIXIR_MAGIC_SERVICE_NAME:$ELIXIR_MAGIC_VERSION && cd ..
kubetpl render ./config/elixir-magic.yml -i ./.env -x $ | kubectl apply -f -

# hello-node build steps
cd ./hello-node && yarn build -t $HELLO_NODE_SERVICE_NAME:$HELLO_NODE_VERSION && cd ..
kubetpl render ./config/hello-node.yml -i ./.env -x $ | kubectl apply -f -

# go-http build steps
cd ./go-http && docker build . -t $GO_HTTP_SERVICE_NAME:$GO_HTTP_VERSION && cd ..
kubetpl render ./config/go-http.yml -i ./.env -x $ | kubectl apply -f -

# Install linkerd
kubectl create ns linkerd 2> /dev/null || true
kubectl apply -f https://raw.githubusercontent.com/linkerd/linkerd-examples/master/k8s-daemonset/k8s/servicemesh.yml
kubectl apply -f ./config/servicemesh.yml
