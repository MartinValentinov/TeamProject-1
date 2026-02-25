#!/bin/bash

set -e

NAMESPACE="quiz-platform"
RELEASE="quiz"

echo "Ensuring namespace exists..."
kubectl get namespace $NAMESPACE >/dev/null 2>&1 || kubectl create namespace $NAMESPACE

echo "Building images..."
docker build -t martin590/com-project1:api-gateway ./api-gateway
docker build -t martin590/com-project1:quiz-service ./quiz-service
docker build -t martin590/com-project1:user-service ./user-service
docker build -t martin590/com-project1:result-service ./result-service

# echo "Pushing images..."
# docker push martin590/com-project1:api-gateway
# docker push martin590/com-project1:quiz-service
# docker push martin590/com-project1:user-service
# docker push martin590/com-project1:result-service

echo "Deploying with Helm..."
helm upgrade --install $RELEASE ./quiz-chart -n $NAMESPACE --create-namespace

echo "Waiting for deployments to be ready..."
for deploy in $(kubectl get deployments -n $NAMESPACE -o jsonpath='{.items[*].metadata.name}'); do
  echo "Waiting for deployment $deploy..."
  kubectl rollout status deployment/$deploy -n $NAMESPACE
done

echo "Deployment completed successfully."

echo "kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8080:80"
kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8080:80