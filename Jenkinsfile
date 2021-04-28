pipeline {
    agent any
    
    tools {
        maven 'local_maven'
    }
    parameters {
         string(name: 'tomcat_staging', defaultValue: '35.154.81.229', description: 'Node2-Remote Staging Server')
    }

    triggers {
         pollSCM('* * * * *')
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
                        sh "scp -v **/*.war jenkins@${params.tomcat_staging}:/opt/tomcat/webapps/"
                    }
                }
            }
        }
    }
}
