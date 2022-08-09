pipeline{
    agent any
    tools{
        maven 'local_maven'
    }
    stages{
        stage ('Build'){
            steps{
                sh 'mvn clean package'
            }
            post{
                success{
                    echo "Archiving the Artifacts"
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
        stage ('Deploy to tomcat server') {
            steps{
                deploy adapters: [tomcat7(credentialsId: '58cccd86-7ec3-4a1a-8dfd-8f664aff0392', path: '', url: 'http://3.108.221.41:8282/')], contextPath: '/opt/tomcat/webapps', war: '**/*.war'
            }
        }
    }
}