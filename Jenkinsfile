pipeline{
    agent any
    
    stages{
        stage ('build'){
            steps{
                sh 'mvn clean package'
            }
            post{
                echo "Archiving the Atrifacts"
                archiveArtifacts artifacts: '**/target/*.war'
            }
        }
        stage ('deploy to tomcat server'){
            steps{
                deploy adapters: [tomcat9(credentialsId: '9c79e835-1725-4469-a87f-30ad06cdbffd', path: '', url: 'http://localhost:8081/')], contextPath: null, war: '**/*.war'
            }
        }
    }
}
