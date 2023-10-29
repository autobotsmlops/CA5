pipeline {
    agent any
    
    environment {
        MYSQL_ROOT_PASSWORD = 'root'
        MYSQL_DATABASE = 'TODO'
    }
    
    stages {
        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Build and push MySQL Docker image
                    def customImage = docker.build("my-mysql-image:${env.BUILD_NUMBER}", "-f src/db/Dockerfile .")
                    customImage.push()
                }
            }
        }
    }
}
