 
pipeline {
    agent any
    environment {
        registry = 'twelcon/cliff_assignment:tagname'
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages {
        stage('Building image') {
            steps{
                script {
                    sh "echo 'Startingg'"
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
    }

}
