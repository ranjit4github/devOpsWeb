pipeline {
    agent any
    
    tools {
        maven 'localMaven'
        jdk 'localJava'
    }

stages{
        stage('Build'){
            steps {
                sh 'mvn clean install'
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
                    //deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://13.127.187.179:8080/')], contextPath: null, war: '**/*.war'
                  echo "Demo Deploy"
              }
          }
    }
}
