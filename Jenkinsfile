node {
    def app
    environment {
        IMAGE = "moriorgames/node-server"
    }

    stage('Clone') {
        echo 'Cloning repository...'
        checkout scm
    }

    stage('Build') {
        echo 'Building Docker image...'
        app = docker.build($IMAGE)
    }

    stage('Test') {
        echo 'Testing...'
        app.inside {
            sh 'npm install'
            sh 'npm test'
        }
    }

    stage('Tear Down') {
        echo 'Removing images...'
        sh 'docker rmi $IMAGE --force'
    }
}
