pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                sh '''
                    python3 -m pip install -r app/requirements.txt
                    pytest app/test_app.py
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build -t makkinakarthik/devops-demo-app:${BUILD_NUMBER} .
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                sh '''
                    docker push makkinakarthik/devops-demo-app:${BUILD_NUMBER}
                '''
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                    kubectl set image deployment/devops-demo \
                    devops-demo=makkinakarthik/devops-demo-app:${BUILD_NUMBER} \
                    -n devops-demo
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                    kubectl rollout status deployment/devops-demo \
                    -n devops-demo
                '''
            }
        }
    }
}
