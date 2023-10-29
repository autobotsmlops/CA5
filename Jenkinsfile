pipeline {
    agent any
    
    environment {
        MYSQL_ROOT_PASSWORD = 'root'
        MYSQL_DATABASE = 'TODO'
        DOCKER_COMPOSE_URL = 'https://github.com/docker/compose/releases/latest/download/docker-compose-Linux-x86_64'
        DOCKER_COMPOSE_PATH = "${JENKINS_HOME}/tools/compose/docker-compose"
    }
    
    stages {
        stage('Install Docker Compose') {
            steps {
                script {
                    // Download Docker Compose binary
                    sh "curl -L ${DOCKER_COMPOSE_URL} -o ${DOCKER_COMPOSE_PATH}"
                    // Ensure executable permissions
                    sh "chmod +x ${DOCKER_COMPOSE_PATH}"
                }
            }
        }
        
        stage('Build and Run Docker Compose') {
            steps {
                script {
                    // Build and run docker-compose using the installed binary
                    sh "${DOCKER_COMPOSE_PATH} -f docker-compose.yaml build"
                    sh "${DOCKER_COMPOSE_PATH} -f docker-compose.yaml up -d"
                }
            }
        }
    }
}
