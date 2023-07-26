@Library('My-Jenkins-SharedLibrary')_

pipeline{
    agent any
    environment{
        demoVar='TestVariable123'
    }
    stages{
        stage ('testStage'){
            steps{
                script{
                    deployDemo.test()
                }
            }
        }
    }
}
