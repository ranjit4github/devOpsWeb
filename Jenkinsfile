pipeline {
    agent{
    	label 'JavaBuildServer'
    }
    
    tools {
        maven 'localMaven'
    }

stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Archiving the artifacts'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('Deployments'){
	    steps {
		echo "Deploying the Artifact"
		deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'tomcatcred', path: '', url: 'http://54.219.144.29:8080/')], contextPath: null, war: '**/*.war'
	    }
	}
    }
}
