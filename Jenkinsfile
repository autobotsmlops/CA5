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
        
        stage('Deploy Containers') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com', 'docker-hub-credentials') {
                        // Start backend container
                        docker.image('autobotsmlops/backend:latest').run('--name backend-container -d')
                        
                        // Start frontend container
                        docker.image('autobotsmlops/frontend:latest').run('--name frontend-container -d')
                    }
                }
            }
        }
    }
    
    post {
        always {
            script {
                // Stop and remove containers
                docker.stop('backend-container', true)
                docker.stop('frontend-container', true)
                docker.remove('backend-container', true)
                docker.remove('frontend-container', true)
            }
        }
    }
}