#!/bin/bash

echo "Creating the flask deployment and service..."

kubectl create -f ./kubernetes/flask-deployment.yaml
kubectl create -f ./kubernetes/flask-service.yaml


echo "Adding the ingress..."

minikube addons enable ingress
kubectl apply -f ./kubernetes/flask-ingress.yaml