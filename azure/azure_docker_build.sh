#!/bin/bash
# Connect docker to Amazon Repo
az acr login --name briannebeker

# Build docker image
mkdir -p azbuild
cp ./Docker/* ./azbuild/
cp ./Node/* ./azbuild/
docker build -t DemoAzure ./azbuild

# Push to Azure repo
docker tag DemoAzure:latest briannebeker.azurecr.io/DemoAzure
docker push briannebeker.azurecr.io/DemoAzure:latest
