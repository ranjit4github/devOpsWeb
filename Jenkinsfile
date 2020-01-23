pipeline {
    agent any
    
    tools {
        maven 'localMaven'
    }
    parameters {
         string(name: 'tomcat_prod', defaultValue: '13.58.160.165', description: 'Node2-Remote Production Server')
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
                stage ("Deploy to Production"){
                    steps {
                        sh "scp -v **/*.war jenkins@${params.tomcat_prod}:/opt/tomcat/webapps/"
                    }
                }
            }
        }
    }
}
