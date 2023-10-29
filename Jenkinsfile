pipeline {
    agent any
    
    environment {
        MYSQL_ROOT_PASSWORD = 'root'
        MYSQL_DATABASE = 'TODO'
    }
    
    stages {
        stage('Build and Run Docker Compose') {
            steps {
                script {
                    // Build and run docker-compose
                    sh 'docker-compose -f docker-compose.yaml build'
                    sh 'docker-compose -f docker-compose.yaml up -d'
                }
            }
        }
    }
}
