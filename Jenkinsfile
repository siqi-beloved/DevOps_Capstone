pipeline {
  environment {
    registry = 'siqili/capstone'
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
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
        script{
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
        }
      }
    stage('Deploy Image') {
      steps {
        script {
          docker.withRegistry( '', registryCredential ) 
          dockerImage.push()
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
