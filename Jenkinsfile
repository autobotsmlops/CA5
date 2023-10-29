pipeline {
    agent any

    parameters{
       string(name: 'VERSION', defaultValue: '1.0', description: 'Add version number')
       booleanParam(name: 'DEPLOY', defaultValue: true, description: 'added to enable or disable Deployement')
    }

    environment {
        BACKEND_IMAGE = 'autobotsmlops/ca4-web:latest'
        FRONTEND_IMAGE = 'autobotsmlops/ca4-db:latest'
        MYSQL_ROOT_PASSWORD = 'root'
        MYSQL_DATABASE = 'TODO'
        MYSQL_USER = 'root'
        MYSQL_PASSWORD = 'root'
        SERVER_CREDENTIALS=credentials('autobotsGit')
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
    
        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t ${BACKEND_IMAGE} -f Dockerfile ./src/db'
                    sh 'docker build -t ${FRONTEND_IMAGE} -f Dockerfile .'

                    // Push the Docker image to Docker Hub
                    sh 'docker push ${BACKEND_IMAGE}'
                    sh 'docker push ${FRONTEND_IMAGE}'
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
            echo "Success"
            // Add post-build steps here if needed
            echo "Database Service built and pushed successfully!"
        }
        failure {
            echo "Failure"
            // Add failure-handling steps here if needed
        }
    }
}
