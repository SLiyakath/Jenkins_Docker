pipeline {
    agent any
    environment {
    DOCKERHUB_CREDENTIALS=credentials('dockerhub')
} 
    stages {
        stage ('Building Docker Image') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SLiyakath/Jenkins_Docker']]])
                sh 'docker build -t apacheserver1 .'
            }
        }    
        stage ('Pushing Docker Image') {
            steps {
            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            sh 'docker tag apacheserver1:latest $DOCKERHUB_CREDENTIALS_USR/apacheserver1:latest'
            sh 'docker push $DOCKERHUB_CREDENTIALS_USR/apacheserver1:latest'
                    }
            } 
        stage ('Node1') {
           agent {
        label 'Node1'
    }
            steps {
                sh 'docker pull sliyakath/apacheserver1'
                sh 'docker run -id --name container1 -p 9000:80 sliyakath/apacheserver1 /bin/bash'
            }
        }    
    }   
    post {
        always {
            sh 'docker logout'
        }
    }
}
