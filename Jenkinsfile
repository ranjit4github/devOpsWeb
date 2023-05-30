pipeline {
    agent any
    
    tools {
        maven 'localMaven'
    }
    environment {
        fname = "Ranjit"
        lname = "Swain"
        version = "1.2"
        system = "Dev"
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
	stage ('Provision EC2 instance'){
		steps {
			sh '''
				cd tf
				terraform init
				terraform apply -auto-approve
			'''
		}
	}
	stage ('Deploy App'){
	    steps {
		sh '''
			echo "Deploying Application"
			ansible-playbook /etc/ansible/deployApp.yml
		'''
	    }
	}
    }
}
