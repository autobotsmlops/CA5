pipeline {
    agent any

    environment {
        MYSQL_DATABASE = 'TODO'
        MYSQL_USER = 'root'
        MYSQL_PASSWORD = 'root'
    }

    stages {
        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    def customImage = docker.build("database-service:${env.BUILD_NUMBER}")

                    // Push the Docker image to Docker Hub
                    customImage.push()
                }
            }
        }
    }

    post {
        success {
            echo "Database Service built and pushed successfully!"
        }
    }
}
