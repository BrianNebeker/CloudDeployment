#!/bin/bash
# Connect docker to Amazon Repo
az acr login --name briannebeker

# Build docker image
mkdir -p azbuild
cp ./Docker/* ./azbuild/
cp ./Node/* ./azbuild/
docker build -t demo-azure ./azbuild

# Push to Azure repo
docker tag demo-azure:latest briannebeker.azurecr.io/demo-azure
docker push briannebeker.azurecr.io/demo-azure:latest
