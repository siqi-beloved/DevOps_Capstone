pipeline {

  environment {
    registry = 'siqili/capstone'
    registryCredential = 'dockerhub'
    dockerImage = ''
    tag = '0.1'
    semicolon = ':'
  }

  agent any

  stages{

    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e capstone/*.html'
      }
    }

    stage('Building Docker Image') {
      steps {
          // sh 'docker image rm siqili/capstone:0.1'
          // sh 'docker build -t siqili/capstone:0.1 .'
          // sh '$ docker system prune --all'
          
          script {
            dockerImage = docker.build registry + semicolon + tag
          }
          sh 'docker image ls -a'
        }
    }

    stage('Push Docker Image to Docker Hub') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    // ec2 for jenkins is in us-east-2, so here we create eks also in same region
    /*stage('Deploy kubenetes'){
	    steps{
	      script{
          eksctl create cluster \
> --name siqi-cluster \
> --version 1.14 \
> --region us-east-2 \
> --nodegroup-name siqi-nodes \
> --node-type t2.micro \
> --nodes 2 \
> --nodes-min 1 \
> --nodes-max 2 \
> --node-ami auto
        	}
	}
    } 
    */
  }

}
