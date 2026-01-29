pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'Github_credentials',
                    url: 'https://github.com/hussamansari/microservice-cicd-kubernetes-pipeline.git'
            }
        }

        stage('Build image') {
            steps {
                script {
                    app = docker.build("hussam201/pipeline:${env.BUILD_ID}")
                }
            }
        }

        stage('Push image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                        bat "docker login -u hussam201 -p %dockerhub%"
                    }
                    app.push("${env.BUILD_ID}")
                }
            }
        }

        stage('Deploy to K8s') {
            steps {
                echo "Deployment started ..."
                bat 'dir'
                bat 'cd'

                bat "powershell -Command (Get-Content deployment.yaml) -replace 'pipeline:latest','pipeline:${env.BUILD_ID}' | Set-Content deployment.yaml"

                bat "kubectl apply -f deployment.yaml"
            }
        }
    }
}
