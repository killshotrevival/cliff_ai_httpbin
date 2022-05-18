 
pipeline {
    agent any
    environment {
        registry = "twelcon/cliff_assignment:tagname"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
            //  dockerImage.push('latest')

          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
        //  sh "docker rmi $registry:latest"

      }
    }

}
