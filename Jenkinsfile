pipeline {
  agent any
  stages {
    stage('Lint Home Page') {
      steps {
        sh 'tidy -q -e capstone/*.html'
      }
    }
    // stage('Upload to AWS') {
    //   steps {
    //     sh 'echo "Hello World"'
    //     s3Upload(file: 'index.html', bucket: 'project3test', path: '/home/ubuntu/index.html')
    //   }
    // }
    stage('Building image') {
      steps {
        withCredentials([[$class:'UsernamePasswordMultiBinding', credentialsId:'dockerhub',usernameVariable:'Docker_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
          sh'''
          docker build -t andresaaap/cloudcapstone:$1.0 .
          '''
        }
      }
    }
    stage('Deploy Image') {
      steps {
        script {
          #docker.withRegistry( '', registryCredential )
          #dockerImage.push()
          
          docker tag local-image:1.0 new-repo:2.0
          docker push new-repo:2.0
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
