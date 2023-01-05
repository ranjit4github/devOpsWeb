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
                    java_build()
                }
            }
        }
        stage ('Upload to S3 Bucket') {
            steps{
                script{
                    upload-using-s3-plugin()
                }
            }
        }
    }
}
