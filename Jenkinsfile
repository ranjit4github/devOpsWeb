pipeline{
	agent any
    tools {
        maven 'localMaven'
    }
	stages{
		stage('Build'){
			steps{
				sh 'mvn clean package'
				sh 'scp Dockerfile centos@3.17.61.170'
				sh 'ssh centos@3.17.61.170 "docker build . -t tomcatwebapp:${env.BUILD_ID}"'
			}
		}
	}
}
