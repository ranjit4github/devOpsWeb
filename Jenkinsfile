pipeline {
    agent any
    
    tools {
        maven 'localMaven'
    }
    parameters {
         string(name: 'staging_server', defaultValue: '13.233.198.150', description: 'Remote Staging Server')
    }

stages{

        stage ('Unit Test'){
            echo "Unit Test"
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
