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
    post{
        success{
            emailext body: 'Test mail', recipientProviders: [buildUser()], subject: 'Test', to: 'rs.ranjitswain@gmail.com'
        }
    }
}
