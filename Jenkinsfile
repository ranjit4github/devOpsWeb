pipeline {
    agent any
    
    tools {
        maven 'localMaven'
    }
    parameters {
         string(name: 'tomcat_stag', defaultValue: '13.58.149.51', description: 'Node1-Remote Staging Server')
         string(name: 'tomcat_prod', defaultValue: '3.135.235.147', description: 'Node2-Remote Production Server')
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
                        bat "pscp **/*.war jenkins@${params.tomcat_stag}:/opt/tomcat/webapps/"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        bat "pscp **/*.war jenkins@${params.tomcat_prod}:/opt/tomcat/webapps/"
                    }
                }
            }
        }
    }
}
