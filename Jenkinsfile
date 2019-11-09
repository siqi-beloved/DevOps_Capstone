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

    stage('Remove Docker Image') {
      steps{
        sh "docker rmi $registry$semicolon$tag"
      }
    }

    // ec2 for jenkins is in us-east-2, so here we create eks also in same region
    stage('Create EKS cluster') {
      steps {
        withAWS(credentials: 'siqijenkinsawscredential', region: 'us-east-2') {
	        sh 'aws eks --region us-east-2 update-kubeconfig --name siqiDevOpsCapstoneCluster'
        }
      }
    }
    stage('Deploy kubenetes'){
	steps{
	  script{
               sh "./Deploy_kubenetes.sh"
            }
	}
    }
  }
}
