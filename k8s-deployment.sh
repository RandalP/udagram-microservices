#!/bin/sh

kubectl apply -f aws-secret.yaml
kubectl apply -f env-secret.yaml
kubectl apply -f env-config.yaml

kubectl apply -f udagram-api-feed/api-feed-deployment.yaml
kubectl apply -f udagram-api-users/api-users-deployment.yaml
sleep 30
kubectl apply -f udagram-reverse-proxy/reverseproxy-deployment.yaml
kubectl apply -f udagram-frontend/frontend-deployment.yaml
