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
  }
}
