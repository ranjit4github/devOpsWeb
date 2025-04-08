pipeline {
    agent {
        label 'APPBUILD'
    }
    
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
                failure{
                    emailext attachLog: true, body: 'Build failed', subject: 'Build Failed - ${BUILDNUMBER}', to: 'ranjitswain@gmail.com'
                }
            }
        }
          stage ('Deploy to Staging'){
              steps {
                    echo 'This is just a demo on Staging server.'
              }
          }
    }
}
