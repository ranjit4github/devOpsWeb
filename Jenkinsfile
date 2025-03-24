pipeline {
    agent any
    
    tools {
        maven 'MAVEN'
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
            parallel{
                stage ("Deploy to Staging"){
                    steps {
                        deploy adapters: [tomcat9(credentialsId: 'tom', path: '', url: 'http://35.92.109.243:8080/')], contextPath: null, war: '**/*.war'
                    }
                }
            }
        }
    }
}
