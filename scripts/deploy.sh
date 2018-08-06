#!/usr/bin/env bash
set -e

export $(cat .env | xargs)

# hello-node build steps
cd ./hello-node && yarn build -t $HELLO_NODE_SERVICE_NAME:$HELLO_NODE_VERSION && cd ..
kubetpl render ./config/hello-node.yml -i ./.env  -x $ | kubectl apply -f -
