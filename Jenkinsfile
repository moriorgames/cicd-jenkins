pipeline {
    agent any

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
                echo '.:npm test'
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
