node {
    stage('Clone') {
        dir('webapp') {
            echo 'Cloning repository....'
            checkout scm
        }
    }
    stage('Create Docker Image') {
        dir('webapp') {
            docker.build("node:4.8.7")
        }
    }
}
