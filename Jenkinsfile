pipeline {
    agent any
    
    tools {
        maven 'localMaven'
        jdk 'localJava'
    }
    environment {
        fname = "Ranjit"
        lname = "Swain"
        version = "1.2"
        system = "Test"
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
          stage ('Deploy to Staging1'){
              steps {
                    echo 'This is just a demo on Staging1 server.'
              }
          }
    }
}
