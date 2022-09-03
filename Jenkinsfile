@Library ('My-Jenkins-SharedLibrary')_

pipeline{
    agent any
    
    tools{
        maven 'local_maven'
    }
    stages{
        stage ('Build'){
            steps{
                script{
                    build()
                }
            }
        }
        stage ('Deploy to tomcat server') {
            steps{
                script{
                    deployDemo()
                }
            }
        }
    }
}
