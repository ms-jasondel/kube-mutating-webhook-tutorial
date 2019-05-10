#!/bin/bash

docker build --no-cache -t wthacr.azurecr.io/webhook:v1 .
docker push wthacr.azurecr.io/webhook:v1
