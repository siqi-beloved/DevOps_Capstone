pipeline {
  agent any
  stages {
    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e capstone/*.html'
      }
    }
    stage('Building Docker Image') {
      steps {
        script {
          dockerImage = docker.build registry + semicolon + tag
        }

        sh 'docker image ls -a'
      }
    }
    stage('Push Docker Image to Docker Hub') {
      steps {
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }

      }
    }
    stage('Create Docker Container') {
      steps {
        withAWS(credentials: 'siqijenkinsawscredential', region: 'us-east-2') {
          sh 'kubectl create deployment test --image=siqili/capstone:0.1'
        }

      }
    }
  }
  environment {
    registry = 'siqili/capstone'
    registryCredential = 'dockerhub'
    dockerImage = ''
    tag = '0.1'
    semicolon = ':'
  }
}