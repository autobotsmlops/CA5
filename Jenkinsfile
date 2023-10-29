pipeline {
    agent any
    
    environment {
        DOCKER_HUB_USERNAME = credentials('autobotsmlops')
        DOCKER_HUB_PASSWORD = credentials('1112222111')
    }
    
    stages {
        stage('Pull Backend Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                    script {
                        docker.withRegistry('https://hub.docker.com', 'docker-hub-credentials') {
                            docker.image('autobotsmlops/backend:latest').pull()
                        }
                    }
                }
            }
        }
        
        stage('Pull Frontend Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                    script {
                        docker.withRegistry('https://hub.docker.com', 'docker-hub-credentials') {
                            docker.image('autobotsmlops/frontend:latest').pull()
                        }
                    }
                }
            }
        }
        
        stage('Deploy with Docker Compose') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
    
    post {
        always {
            sh 'docker-compose down'
        }
    }
}