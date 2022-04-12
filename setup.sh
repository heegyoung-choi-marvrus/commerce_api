#!/bin/bash

DOCKER="docker"
IMAGE_NAME="commerce_api"
VERSION="0.1"
PORT="8005"

$DOCKER build -t $IMAGE_NAME:$VERSION .
$DOCKER run -itd --name $IMAGE_NAME -p 8005:8005 -v ~/PycharmProjects/commerce_api:/commerce_api $IMAGE_NAME:$VERSION
IP_ADDRESS=$($DOCKER inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $IMAGE_NAME)
until [ "`$DOCKER inspect -f '{{.State.Running}}' $IMAGE_NAME`"=="true" ]; do
  sleep 1;
done;
$DOCKER exec -it $IMAGE_NAME uvicorn main:app --reload --host $IP_ADDRESS --port 8005