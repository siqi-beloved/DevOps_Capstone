#!/usr/bin/env bash


#get nodes status
kubectl get nodes
#pull image from dockerhub
docker pull siqili/capstone:0.1
#create deplyments
kubectl apply -f kubernetes/deployment.yaml
#get deployment status
Kubectl get deployments
