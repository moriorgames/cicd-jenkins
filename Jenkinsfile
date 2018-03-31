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

        sh "docker login -u${DOCKER_REGISTRY_USR} -p${DOCKER_REGISTRY_PWD}"

        sh "docker tag moriorgames/node-server docker.io/moriorgames/node-server:${env.BUILD_NUMBER}"
        sh "docker tag moriorgames/node-server docker.io/moriorgames/node-server:latest"

        sh "docker push docker.io/moriorgames/node-server:${env.BUILD_NUMBER}"
        sh "docker push docker.io/moriorgames/node-server:latest"
    }

    stage('Tear Down') {
        echo 'Removing images...'
        sh 'docker rmi moriorgames/node-server --force'
    }
}
