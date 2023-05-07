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
		failure{
        		emailext attachLog: true, body: 'Email sent out from Jenkins', subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', to: 'rs.ranjitswain@gmail.com'
      		}
            }
        }

        stage ('Deployments'){
                stage ('Deploy to Staging'){
                    steps {
                        deploy adapters: [tomcat7(credentialsId: 'tomcat2', path: '', url: 'http://3.110.213.23:8080/')], contextPath: null, onFailure: false, war: '**/*.war'
                    }
                }

            }
        }
}
