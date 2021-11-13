@Library('My-Jenkins-SharedLibrary') _
pipeline {
    agent none
    //agent any
    

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
    }
}
