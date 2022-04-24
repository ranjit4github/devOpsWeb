@Library('My-Jenkins-SharedLibrary') _
pipeline {
    agent any
    tools {
        maven 'local_maven'
    }
    environment{
        staging_server = '15.207.85.64'
        staging_server_2 = '15.207.85.65'
        version = '2.2'
        system = 'staging'
    }

stages{
    
    stage('Sonarqube Scan'){
        steps{
            script{
                scan()
            }
           }
    }
        stage('Java Build'){
            steps {
                script{
                    java_build()
                }
            }
        }
        stage ("Deploy to Staging"){
            steps {
                script{
                    deploy()
                }
            }
        }
    stage ("Upload to S3"){
        steps {
            script{
                upload()
            }
        }
    }
    }
}
