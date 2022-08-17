#!/bin/bash
# Connect docker to Amazon Repo
az acr login --name briannebeker

kubectl apply -f ./deploy/azure/demo-azure.yaml