#!/bin/bash

docker build --no-cache -t wthacr.azurecr.io/webhook:dbg -f Dockerfile .
docker push wthacr.azurecr.io/webhook:dbg
