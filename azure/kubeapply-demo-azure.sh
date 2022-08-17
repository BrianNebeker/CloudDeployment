#!/bin/bash
# Connect docker to Amazon Repo
az acr login --name briannebeker
az aks get-credentials --resource-group dev_group --name dev

kubectl apply -f ./deploy/azure/demo-azure.yaml
kubectl get all

kubectl get ingress ingress-app-demo -o jsonpath='{.status.loadBalancer.ingress[0].ip}' > ingressip
url="http://$(<ingressip)"
printf "\nOutput from URL $url \n"
curl $url
printf "\n\n"