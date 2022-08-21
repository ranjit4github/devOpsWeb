pipeline {
    agent any
    
    tools {
        maven 'local_maven'
    }
    environment {
        fname = "Ranjit"
        lname = "Swain"
        version = "1.2"
        system = "Dev"
    }

stages{
        stage('Build'){
            steps {
                echo "Building"
            }
        }
    post{
        success{
            emailext body: 'A Test Email', recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: 'Test mail'
        }
    }

        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging'){
                    /*agent {
                       label 'linuxagent'
                    }*/
                    steps {
                        
                        echo "This is made by ${env.fname} ${env.lname}"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        echo 'This is just a demo on Production server.'
                    }
                }
            }
        }
    }
}
