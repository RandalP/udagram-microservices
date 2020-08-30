#!/bin/sh

kubectl apply -f aws-secret.yaml
kubectl apply -f env-secret.yaml
kubectl apply -f env-config.yaml

kubectl apply -f udagram-api-feed/api-feed-deployment.yaml
kubectl apply -f udagram-api-users/api-users-deployment.yaml
kubectl autoscale deployment api-feed-svc --cpu-percent=50 --min=1 --max=2

kubectl apply -f udagram-api-feed/api-feed-service.yaml
kubectl apply -f udagram-api-users/api-users-service.yaml
kubectl autoscale deployment api-users-svc --cpu-percent=50 --min=1 --max=2

sleep 60

kubectl apply -f udagram-reverse-proxy/reverseproxy-deployment.yaml
kubectl apply -f udagram-reverse-proxy/reverseproxy-service.yaml
kubectl autoscale deployment reverseproxy-svc --cpu-percent=50 --min=1 --max=2

sleep 30

kubectl apply -f udagram-frontend/frontend-deployment.yaml
kubectl apply -f udagram-frontend/frontend-service.yaml

