pipeline {
    agent any
    
    tools {
        maven 'localMaven'
    }

stages{

        stage ('Unit Test'){
            steps {
                echo "Unit Test"
            }
        }
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo "Email triggered"
                }
            }
        }

        stage ('Deploy'){
            parallel{
                stage ("Deploy to Staging Server1"){
                    steps {
                        deploy adapters: [tomcat8(credentialsId: 'tomcatCred', path: '', url: 'http://13.232.190.109:8181/')], contextPath: null, war: '**/*.war'
                    }
                }
                stage ('Deploy to staging Server2'){
                    steps{
                        echo "Deploy to server2!"
                    }
                }
            }
        }
    }
}
