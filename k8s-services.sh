#!/bin/sh

kubectl apply -f udagram-reverse-proxy/reverseproxy-service.yaml
kubectl autoscale deployment reverseproxy-svc --cpu-percent=50 --min=1 --max=2
echo WARNING! Update apiHost with external address of reverseproxy-svc before deploying frontend.

kubectl apply -f udagram-frontend/frontend-service.yaml
echo WARNING! Update env-config URL with external address of frontend-svc before deploying api-feed-svc and api-users-svc

kubectl apply -f udagram-api-feed/api-feed-service.yaml
kubectl apply -f udagram-api-users/api-users-service.yaml
kubectl autoscale deployment api-feed-svc --cpu-percent=50 --min=1 --max=2
kubectl autoscale deployment api-users-svc --cpu-percent=50 --min=1 --max=2