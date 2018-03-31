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
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            // available as an env variable, but will be masked if you try to print it out any which way
            // note: single quotes prevent Groovy interpolation; expansion is by Bourne Shell, which is what you want
            sh 'echo $PASSWORD'
            // also available as a Groovy variable
            echo USERNAME
            // or inside double quotes for string interpolation
            echo "username is $USERNAME"
        }

    }

    stage('Tear Down') {
        echo 'Removing images...'
        sh 'docker rmi moriorgames/node-server --force'
    }
}
