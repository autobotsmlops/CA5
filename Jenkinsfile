pipeline {
    agent any

    environment {
        BACKEND_IMAGE = 'autobotsmlops/backend:latest'
        FRONTEND_IMAGE = 'autobotsmlops/frontend:latest'
        MYSQL_ROOT_PASSWORD = 'root'
        MYSQL_DATABASE = 'TODO'
        MYSQL_USER = 'root'
        MYSQL_PASSWORD = 'root'
    }

    stages {
        stage('Check Docker Images Existence') {
            steps {
                script {
                    def backendImageExists = sh(script: "docker image inspect ${BACKEND_IMAGE} &> /dev/null", returnStatus: true)
                    def frontendImageExists = sh(script: "docker image inspect ${FRONTEND_IMAGE} &> /dev/null", returnStatus: true)

                    if (!backendImageExists) {
                        error("Backend Docker image does not exist: ${BACKEND_IMAGE}")
                    }
                    if (!frontendImageExists) {
                        error("Frontend Docker image does not exist: ${FRONTEND_IMAGE}")
    
        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    def customImage = docker.build("database-service:${env.BUILD_NUMBER}")

                    // Push the Docker image to Docker Hub
                    customImage.push()
                }
            }
        stage('Build and Run Docker Compose') {
            steps {
                script {
                    // Ensure the docker-compose.yaml file is in the current workspace
                    sh 'cp /path/to/your/docker-compose.yaml ./docker-compose.yaml'
                }
                // Build and run the Docker Compose services
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        success {
            echo "Success"
            // Add post-build steps here if needed
        }
        failure {
            echo "Failure"
            // Add failure-handling steps here if needed
        }
    }

    post {
        success {
            echo "Database Service built and pushed successfully!"
        }
    }
}
