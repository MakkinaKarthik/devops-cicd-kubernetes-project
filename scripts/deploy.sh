#!/bin/bash

set -e

echo "Deploying application..."

kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Waiting for deployment..."

kubectl rollout status deployment/devops-demo \
    -n devops-demo

echo "Deployment completed."

