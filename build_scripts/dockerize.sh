#!/bin/bash

# Create Docker for Dotnet Autocert

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ROOT_DIR=$SCRIPT_DIR/..

VERSION=1.0.0
IMAGE_NAME=dotnet-autocert

docker build -t $IMAGE_NAME:$VERSION "$ROOT_DIR"
docker save -o $IMAGE_NAME-$VERSION.tar $IMAGE_NAME:$VERSION

zip $IMAGE_NAME-docker.zip $IMAGE_NAME-$VERSION.tar

mkdir -p "$ROOT_DIR"/dist
mv $IMAGE_NAME-docker.zip $IMAGE_NAME-$VERSION.tar "$ROOT_DIR"/dist
