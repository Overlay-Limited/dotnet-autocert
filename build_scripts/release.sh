#!/bin/bash

# Create Release for Dotnet Autocert

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ROOT_DIR=$SCRIPT_DIR/..

rm -rf "$ROOT_DIR"/dist
mkdir -p "$ROOT_DIR"/dist

(cd "$SCRIPT_DIR" && ./dockerize.sh)

chmod -R a+rwx "$ROOT_DIR"/dist
