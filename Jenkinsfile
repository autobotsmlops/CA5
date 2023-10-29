pipeline {
    agent any
    
    environment {
        MYSQL_ROOT_PASSWORD = 'root'
        MYSQL_DATABASE = 'TODO'
    }
    
    stages {
        stage('Install Docker Compose') {
            steps {
                script {
                    // Install Docker Compose
                    sh 'curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose'
                    sh 'chmod +x /usr/local/bin/docker-compose'
                }
            }
        }
        
        stage('Build and Run Docker Compose') {
            steps {
                script {
                    // Build and run docker-compose using the installed binary
                    sh 'docker-compose -f docker-compose.yaml build'
                    sh 'docker-compose -f docker-compose.yaml up -d'
                }
            }
        }
    }
}
