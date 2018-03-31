node {
    def app

    stage('Docker Login') {
        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            sh 'docker login -u$USERNAME -p$PASSWORD'
        }
    }

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
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'docker-hub-credentials',
            usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {

            sh "docker tag moriorgames/node-server docker.io/moriorgames/node-server:latest"
            sh "docker tag moriorgames/node-server docker.io/moriorgames/node-server:${env.BUILD_NUMBER}"

            sh 'docker login -u$USERNAME -p$PASSWORD'

            sh "docker push docker.io/moriorgames/node-server:${env.BUILD_NUMBER}"
            sh "docker push docker.io/moriorgames/node-server:latest"
        }
    }

    stage('Tear Down') {
        echo 'Removing images...'
        sh 'docker rmi moriorgames/node-server --force'
    }
}
