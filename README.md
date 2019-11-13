#Based on Feedbacks
1. The project takes a Dockerfile and creates a Docker container in the pipeline.
 This is done by running the ./kubernetes/deployment.yaml
 To run the command, we use the command "kubectl apply -f kubernetes/deployment.yaml" - added in "deploy to cluster.sh" file.

2. A screenshot of the AWS console in the EKS section showing the cluster
   See picture: Eks_cluster
3. A screenshot of the AWS console in the CloudFormation section showing the stack for the cluster
   See picture: CloudFormation_stack

4. Please explain in detail how the rolling deployment works in kubernetes in your project and how did you implement it. You can create a list of the events that happened from the start to the end of a rolling deployment.
Rolling Deployment is implemented by these lines in deployment.yaml file:
    spec:
      replicas: 3
      selector:
        matchLabels:
          app: capstone
      strategy:
        type: RollingUpdate
        rollingUpdate:
          maxSurge: 0
          maxUnavailable: 1
# Outline
 1. Create an Nginx “Hello World” static website application. 

 2. builder docker container, which should serve a static website

 3. build Jenkins pipelines for linting html file, building docker image and uploading docker image to Dockerhub

 4. build kubenetes container on AWS with eksctl_cluster.sh based on the image on dockerhub

 5. serve our website on AWS kubenetes with rolling deployment with deploy to cluster.sh
 
 

