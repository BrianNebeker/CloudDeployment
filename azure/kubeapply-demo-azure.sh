#!/bin/bash
# Connect docker to Amazon Repo
az acr login --name briannebeker
az aks get-credentials --resource-group dev_group --name dev

kubectl apply -f ./deploy/azure/demo-azure.yaml

# Check deployment rollout status every 10 seconds (max 10 minutes) until complete.
printf "\nWaiting for rollout of application\n"

ATTEMPTS=0
ROLLOUT_STATUS_CMD="kubectl rollout status deployment/app-demo -w --timeout=10s"
until $ROLLOUT_STATUS_CMD || [ $ATTEMPTS -eq 30 ]; do
  $ROLLOUT_STATUS_CMD
  ATTEMPTS=$((attempts + 1))
  sleep 10
done

kubectl get all
kubectl get ingress

# Get the ingress public IP and hit the application to verify the deployment
kubectl get ingress ingress-app-demo -o jsonpath='{.status.loadBalancer.ingress[0].ip}' > ingressip
url="http://$(<ingressip)"

printf "\nOutput from URL $url \n"
curl $url
printf "\n\n"