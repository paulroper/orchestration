#!/usr/bin/env bash
set -e

export $(cat .env | xargs)

# Install linkerd
linkerd install | kubectl apply -f -
kubectl apply -f ./config/servicemesh.yml

# elixir-magic build steps
cd ./elixir-magic && docker build . -t $ELIXIR_MAGIC_SERVICE_NAME:$ELIXIR_MAGIC_VERSION && cd ..
kubetpl render ./config/elixir-magic.yml -i ./.env -x $ | linkerd inject - | kubectl apply -f -

# front-end build steps
cd ./front-end && yarn build -t $FRONT_END_SERVICE_NAME:$FRONT_END_VERSION && cd ..
kubetpl render ./config/front-end.yml -i ./.env -x $ | linkerd inject - | kubectl apply -f -

# go-http build steps
cd ./go-http && docker build . -t $GO_HTTP_SERVICE_NAME:$GO_HTTP_VERSION && cd ..
kubetpl render ./config/go-http.yml -i ./.env -x $ | linkerd inject - | kubectl apply -f -

# hello-node build steps
cd ./hello-node && yarn build -t $HELLO_NODE_SERVICE_NAME:$HELLO_NODE_VERSION && cd ..
kubetpl render ./config/hello-node.yml -i ./.env -x $ | linkerd inject - | kubectl apply -f -

# proxy build steps
cd ./proxy && yarn build -t $PROXY_SERVICE_NAME:$PROXY_VERSION && cd ..
kubetpl render ./config/proxy.yml -i ./.env -x $ | linkerd inject - | kubectl apply -f -
