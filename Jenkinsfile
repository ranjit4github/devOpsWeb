pipeline {
    agent any
    
    tools {
        maven 'localMaven'
    }
    parameters {
         string(name: 'tomcat_stag', defaultValue: '18.190.28.180', description: 'Node1-Remote Staging Server')
         string(name: 'tomcat_prod', defaultValue: '18.222.204.51', description: 'Node2-Remote Production Server')
    }

    triggers {
         pollSCM('* * * * *')
     }

stages{
        stage('Build'){
            steps {
                bat 'mvn clean package'
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
                stage ('Deploy to Staging'){
                    steps {
                        bat "pscp target/*.war jenkins@${params.tomcat_stag}:/opt/tomcat/webapps/"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        bat "pscp target/*.war jenkins@${params.tomcat_prod}:/opt/tomcat/webapps/"
                    }
                }
            }
        }
    }
}
