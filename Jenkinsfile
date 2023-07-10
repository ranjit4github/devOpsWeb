pipeline {
    agent any
    
    tools {
        maven 'localMaven'
        jdk 'Java8'
    }

stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Archiving the artifacts'
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        }
    }
}
