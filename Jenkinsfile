pipeline {
    agent any

stages{
        stage('Build'){
            steps {
                echo "Building"
            }
        }
    }
    post{
        success{
            emailext attachLog: true, body: 'Build Succeeded', subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', to: 'rs.ranjitswain@gmail.com'
        }
        failure{
            emailext attachLog: true, body: 'Build Failed', subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', to: 'rs.ranjitswain@gmail.com'
        }
    }
}
