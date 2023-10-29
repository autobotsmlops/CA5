pipeline {
    agent any

    parameters{
       string(name: 'VERSION', defaultValue: '1.0', description: 'Add version number')
       booleanParam(name: 'BUILD', defaultValue: true, description: 'added to enable or disable Build for testing')
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
                    // Check if the Docker images exist on Docker Hub
                    def res = sh(script: 'docker image inspect ${BACKEND_IMAGE}')

                    echo "${res}"
                }
            }
        }  
    
        stage('Build and Push Docker Images') {
            steps {
                script {
                    // Build Backend Image 
                    if (params.BUILD) {
                        sh 'docker build -t ${BACKEND_IMAGE} -f Dockerfile ./src/web'
                    }
                }
            }
            steps {
                script {
                    // Build Frontend Image 
                    if (params.BUILD) {
                        sh 'docker build -t ${FRONTEND_IMAGE} -f Dockerfile .'
                    } 
                }
            }
            steps {
                script {
                    // Push the Docker images to Docker Hub
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
            echo "Frontend Service built and pushed successfully!"
            echo "Docker Compose services built and running successfully!"
        }
        failure {
            echo "Failure"
            // Add failure-handling steps here if needed
        }
    }
}
