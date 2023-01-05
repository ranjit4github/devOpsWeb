pipeline{
    agent any
    
    tools{
        maven 'localMaven'
    }
    stages{
        stage ('Build'){
            steps{
                echo "Building java project"
                sh 'mvn clean package'
            }
        }
        stage ('Upload to S3 Bucket') {
            steps{
                echo "Uploading the artifacts into S3 Bucket"
                script{
                    upload-using-s3-plugin()
                }
            }
        }
    }
}
