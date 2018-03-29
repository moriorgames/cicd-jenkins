pipeline {
    agent {
        docker { image 'node:4.8.7' }
    }

    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }
        stage('Dependencies') {
            steps {
                echo 'Installing dependencies ...'
                echo '.:npm install'
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
