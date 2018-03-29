pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            docker.image('node:4.8.7').inside {
                echo 'Installing dependencies ...'
                echo '.:npm install'
                sh 'docker build -t moriorgames/node-server .'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing ...'
                sh 'node --version'
            }
        }
        stage('Build') {
            steps {
                echo 'Building....'
                echo '.:docker build'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                echo '.:docker tag && docker push'
            }
        }
    }
}
