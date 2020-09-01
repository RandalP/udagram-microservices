#!/bin/sh

kubectl apply -f udagram-reverse-proxy/reverseproxy-service.yaml

kubectl apply -f udagram-frontend/frontend-service.yaml
echo WARNING! Update env-config URL with external address of frontend-svc before deploying api-feed-svc and api-users-svc so CORS works
kubectl get service/frontend-svc

kubectl apply -f udagram-api-feed/api-feed-service.yaml
kubectl apply -f udagram-api-users/api-users-service.yaml
