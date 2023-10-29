pipeline {
    agent {
        label 'agent-label' // Replace 'agent-label' with the label of an available Jenkins agent
    }
    
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
            node('agent-label') {
                sh 'docker stop backend-container'
                sh 'docker stop frontend-container'
                sh 'docker rm backend-container'
                sh 'docker rm frontend-container'
            }
        }
    }
}