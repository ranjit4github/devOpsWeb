@Library('My-Jenkins-SharedLibrary') _
pipeline {
    agent any
    tools {
        maven 'local_maven'
    }
    environment{
        staging_server = '15.208.86.64'
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
