pipeline{
    agent any{
        label 'linuxagent'
    }
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
                deploy adapters: [tomcat9(credentialsId: 'd27472d4-1d20-42e9-aefc-45d27de10a05', path: '', url: 'http://52.66.214.37:8080/')], contextPath: null, war: '**/*.war'
                echo "Deployment"
            }
        }
    }
}
