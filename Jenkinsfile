pipeline {
  agent any
  stages {
    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e *.html'
      }
    }
    stage('Upload to AWS') {
      steps {
        sh 'echo "Hello World"'
        s3Upload(file: 'index.html', bucket: 'project3test', path: '/home/ubuntu/index.html')
      }
    }
    stage('Building image') {
      steps {
        script {
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
  }
  environment {
    registry = 'gustavoapolinario/docker-test'
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  options {
    withAWS(region: 'us-east-2', credentials: 'aws-static')
  }
}