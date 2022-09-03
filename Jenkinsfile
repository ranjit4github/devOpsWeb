pipeline{
    agent any
    
    tools{
        maven 'local_maven'
    }
    stages{
        stage ('Build'){
            steps{
                echo "Building"
            }
        }
        stage ('Deploy to tomcat server') {
            steps{

                echo "Deployment"
            }
        }
    }
}
