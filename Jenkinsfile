pipeline {
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/siqi-beloved/DevOps_Capstone'
      }
    }
    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e capstone/*.html'
      }
    }
    stage('Building image') {
      steps {
        script {
          dockerImage = docker.build registry + ":${BUILD_NUMBER}"
        }
      }
    }
    stage('Deploy Image') {
      steps {
        script{
          docker push --disable-content-trust dockerImage
        }
      }
    }
    stage('Build Container') {
      steps {
        script {
          docker container create --name mywebsite "${dockerImage}:${BUILD_NUMBER}"
        }

      }
    }
    stage('Remove Unused docker image') {
      steps {
        sh "docker rmi ${registry}:${BUILD_NUMBER}"
      }
    }
  }
  environment {
    registry = 'siqili/capstone'
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
}
