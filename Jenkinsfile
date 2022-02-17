pipeline {
    agent { label 'ubuntu1'}
    tools {
        go 'go-1.17.6'
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
                
            }
            
        }
        stage('deployment') {
            steps {
                echo 'deploying the application'
            }
            
        }
    }

    post{
        always{
            junit 'report.xml'
        }
    }
}
