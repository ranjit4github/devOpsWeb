pipeline {
    agent any
    
    tools {
        maven 'localMaven'
    }
    parameters {
         string(name: 'tomcat_stag', defaultValue: '13.58.109.232', description: 'Node1-Remote Staging Server')
         string(name: 'tomcat_prod', defaultValue: '3.135.225.83', description: 'Node2-Remote Production Server')
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
                stage ('Deploy to Staging'){
                    steps {
                        sh "scp -i /home/ubuntu/findme.pem **/target/*.war ubuntu@${params.tomcat_stag}:/usr/share/tomcat/webapps"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        sh "scp -i /home/ubuntu/findme.pem **/target/*.war ubuntu@${params.tomcat_prod}:/usr/share/tomcat/webapps"
                    }
                }
            }
        }
    }
}
