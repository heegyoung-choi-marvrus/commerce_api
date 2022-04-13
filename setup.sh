#!/bin/bash

DOCKER="docker"
DOCKER_COMPOSE="docker-compose"
IMAGE_NAME="commerce_api"
VERSION="0.1"
PORT="8005"
NETWORK_NAME="commerce_api_local_network"

$DOCKER build -t $IMAGE_NAME:$VERSION . || true
$DOCKER network create $NETWORK_NAME || true
$DOCKER run -itd --name $IMAGE_NAME --network $NETWORK_NAME -p $PORT:$PORT -v ~/PycharmProjects/commerce_api:/commerce_api $IMAGE_NAME:$VERSION
IP_ADDRESS=$($DOCKER inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $IMAGE_NAME)
until [ "`$DOCKER inspect -f '{{.State.Running}}' $IMAGE_NAME`"=="true" ]; do
  sleep 1;
done;
#$DOCKER_COMPOSE -f ~/PycharmProjects/commerce_api/docker-compose-local-db.yml up
$DOCKER exec -it $IMAGE_NAME uvicorn main:app --reload --host $IP_ADDRESS --port $PORT