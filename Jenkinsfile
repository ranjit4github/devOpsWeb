pipeline {
    agent any
    
    tools {
        maven 'local_maven'
    }
    environment {
        fname = "Ranjit"
        lname = "Swain"
        version = "1.2"
        system = "Test"
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

        stage ('Deliver to test server'){
            parallel{
                stage ('Deploy to Staging1'){
                    steps {
                        echo "This is made by ${env.fname} ${env.lname}"
                        echo "it's running on ${env.system} and the version is ${env.version}"
                        deploy adapters: [tomcat7(credentialsId: '58cccd86-7ec3-4a1a-8dfd-8f664aff0392', path: '', url: 'http://13.233.215.95:8282/')], contextPath: null, war: '**/*.war'
                    }
                }

                stage ("Deploy to Staging2"){
                    steps {
                        echo 'This is just a demo on Staging2 server.'
                    }
                }
            }
        }
    }
}

