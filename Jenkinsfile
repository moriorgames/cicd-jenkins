node {
    def app

    stage('Clone') {
        echo 'Cloning repository...'
        checkout scm
    }

    stage('Build') {
        echo 'Building Docker image...'
        app = docker.build("moriorgames/node-server")
    }

    stage('Test') {
        echo 'Testing...'
        app.inside {
            sh 'npm test'
        }
    }
}
