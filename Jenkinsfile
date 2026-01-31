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
                        sh "docker login -u hussam201 -p ${dockerhub}"
                    }
                    app.push("${env.BUILD_ID}")
                }
            }
        }

       
        stage('Authenticate to EKS') {
            steps {
                sh '''
                  aws eks update-kubeconfig \
                    --region eu-north-1 \
                    --name hussamcluster
                '''
            }
        }

        stage('Deploy to K8s') {
            steps{
                echo "Deployment started ..."
                sh 'ls -ltr'
                sh 'pwd'
                sh "sed -i 's/pipeline:latest/pipeline:${env.BUILD_ID}/g' deployment.yaml"
                sh "kubectl apply -f deployment.yaml"
            }
        }
    }    
}
