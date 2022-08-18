#!/bin/bash
# Connect docker to Amazon Repo
az acr login --name briannebeker

# Push to Azure repo
docker tag demo-azure:$1 briannebeker.azurecr.io/demo-azure:latest
docker push briannebeker.azurecr.io/demo-azure:latest
