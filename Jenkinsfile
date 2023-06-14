@Library ('My-Jenkins-SharedLibrary')_
pipeline {
agent any

  stages{
    stage('Build'){
      steps{
        script{
          build()
        }
      }
    }
    stage('Deploy'){
       steps{
        script{
          deployDemo()
        }
      }
    }
  }
}
