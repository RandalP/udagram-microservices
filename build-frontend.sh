#!/bin/sh

docker build -t udagram-frontend ./udagram-frontend
docker tag udagram-frontend randalp/udagram-frontend:latest
docker push randalp/udagram-frontend
echo docker image pushed