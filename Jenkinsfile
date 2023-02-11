pipeline{
    agent any
    stages {
        stage('Clone repository') {
            steps {
                script {
                    def repoExists = false
                    try {
                        sh """ls /var/lib/jenkins/workspace/jen-apache1"""
                        repoExists = true
                    } 
                    catch (Exception e) {
                        repoExists = false
                    }
                    if (repoExists) {
                        sh """
                        sudo git pull https://github.com/shubhzzz19/jen-apache.git
                        """
                    } 
                    else {
                        sh """
                        sudo git clone https://github.com/shubhzzz19/jen-apache.git
                        """
                    }
                }
            }
        }
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '47ba8edd-2db0-470e-9fe6-c6f26b724f8c', url: 'https://github.com/shubhzzz19/jen-apache.git']]])
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -f Dockerfile -t apache .'
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'docker run -p 80:80 --name apache-container apache'
            }
        }
    }
}
