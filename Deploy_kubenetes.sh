#!/bin/bash

echo "Creating the flask deployment and service..."

kubectl create -f ./kubernetes/flask-deployment.yaml
kubectl create -f ./kubernetes/flask-service.yaml
