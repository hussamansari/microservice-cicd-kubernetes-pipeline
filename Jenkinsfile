pipeline {
    agent any	
    stages {
	    stage('Checkout') {
		    steps {
			    checkout scm
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
	 
	    stage('Deploy to K8s') {
		    steps{
			    echo "Deployment started ..."
			    sh 'ls -ltr'
			    sh 'pwd'
			    sh "sed -i 's/pipeline:latest/pipeline:${env.BUILD_ID}/g' deployment.yaml"
                            sh "kubectl -f apply deployment.yaml"
	    		}
        	}
    	}    
}
