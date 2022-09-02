pipeline {

  agent any
  
  stages{
    stage ('Build'){
      steps{
        echo "Builing the project"
    }
  }
  }
    post{
      success{
        emailext attachLog: true, body: 'Email sent out from Jenkins', subject: 'Test Email - Success', to: 'rs.ranjitswain@gmail.com'
      }
      failure{
        emailext attachLog: true, body: 'Email sent out from Jenkins', subject: 'Test Email - Failed', to: 'rs.ranjitswain@gnail.com'
      }
    }
}
