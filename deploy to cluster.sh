#!/usr/bin/env bash


#get nodes status
kubectl get nodes
#pull image from dockerhub
docker pull siqili/capstone:0.1
#create deplyments
kubectl create deployment nginx --image=siqili/capstone:0.1
#get deployment status
Kbectl get deployments
