pipeline {
    agent any

    environment {
        BACKEND_IMAGE = 'autobotsmlops/backend:latest'
        FRONTEND_IMAGE = 'autobotsmlops/frontend:latest'
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
                    }
                }
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
            // Add post-build steps here if needed
        }
    }
}
