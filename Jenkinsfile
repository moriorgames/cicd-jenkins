node {
    def app

    stage('Build') {
        echo 'Cloning repository...'
        checkout scm
        echo 'Building Docker image...'
        app = docker.build("moriorgames/node-server")
    }

    stage('Test') {
        echo 'Testing...'
        app.inside {
            sh 'npm install'
            sh 'npm test'
        }
    }

    stage('Push') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }

    stage('Tear Down') {
        echo 'Removing images...'
        sh 'docker rmi moriorgames/node-server --force'
    }
}
