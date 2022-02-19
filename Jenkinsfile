pipeline {
    agent { label 'ubuntu1'}
    tools {
        go 'go-1.17.7'
    }
    environment {
        registry = "mat21445/Jenkins_test"
        registryCredential = 'DockerHub'
        dockerImage = ''
    }
    stages {
        stage('unit testing') {
            steps {
                echo 'performing unit tests'
                sh 'make test'
            }
        }
        stage('build') {
            steps {
                echo 'building the application'
                sh 'go version'
                sh 'go build'
            }
        }
        stage('containerization') {
            steps {
                echo 'Containerize the application'
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
            
        }
        stage('deployment') {
            steps {
                echo 'deploying the application'
            script {
                docker.withRegistry( '', registryCredential ) {
                dockerImage.push()
            }
            }
            }
            
        }
        stage('Cleaning up') {
            steps{
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }

    post{
        always{
            junit 'report.xml'
        }
    }
}
