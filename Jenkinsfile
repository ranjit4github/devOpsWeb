pipeline {
    agent {
        label 'JAVA_BUILD_SERVER'
    }
    
    tools {
        maven 'localMaven'
        jdk 'localJava'
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
                    deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://13.127.187.179:8080/')], contextPath: null, war: '**/*.war'
              }
          }
    }
}
