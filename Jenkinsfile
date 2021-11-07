pipeline {
    agent JavaAgent
    
    tools {
        maven 'local_maven'
    }
    parameters {
         string(name: 'staging_server', defaultValue: '65.0.101.113', description: 'Remote Staging Server')
    }

stages{
    
    stage('Sonarqube Scan'){
        steps{
            echo "Scanning..."
           }
    }
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
        stage ("Deploy to Staging"){
            steps {
                sh "scp -v -o StrictHostKeyChecking=no **/*.war root@${params.staging_server}:/opt/tomcat/webapps/"
            }
        }
    }
}
