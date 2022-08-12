pipeline {
    agent any
    
    tools {
        maven 'local_maven'
    }
    parameters {
         string(name: 'tomcat_stag', defaultValue: '13.233.166.195', description: 'Node1-Remote Staging Server1')
    }
    environment {
        fname = "Ranjit"
        lname = "Swain"
        version = "1.2"
        system = "Dev"
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
                        sh "scp **/*.war root@${params.tomcat_stag}:/opt/tomcat/webapps/"
                        echo "This is made by ${env.fname} ${env.lname}"
                        echo "it's running on ${env.system} and the version is ${env.version}"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        echo 'This is just a demo on Production server.'
                    }
                }
            }
        }
    }
}
