pipeline {

  agent any
  
  stages{
    stage ('Build'){
      steps{
        echo "Builing the project"
    }
  }
    post{
      success{
        emailext body: 'Email sent out from Jenkins', subject: 'Test Email', to: 'rs.ranjitswain@gmail.com'
      }
    }
}
