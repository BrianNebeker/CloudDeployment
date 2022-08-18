#!/bin/bash
# Connect docker to Amazon Repo
az acr login --name briannebeker

# Build docker image
mkdir -p azbuild
cp ./Docker/* ./azbuild/
cp ./Node/* ./azbuild/
sed -i "s/%BUILD%/${1}/g" ./azbuild/script.js
docker build -t demo-azure ./azbuild

# Push to Azure repo
docker tag demo-azure:$1 briannebeker.azurecr.io/demo-azure:latest
docker push briannebeker.azurecr.io/demo-azure:latest
