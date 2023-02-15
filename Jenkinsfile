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
        stage('Deleting the previous container and image') {
            steps {
                script {
                    try {
                        sh """
                        sudo docker stop apache-container
                        sudo docker rm apache-container
                        sudo docker image rm apache
                        """
                    } 
                    catch (Exception e) {
                        sh 'sudo echo "Proceeded futher"'
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'sudo docker build -f Dockerfile -t apache .'
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'sudo docker run -d -p 80:80 --name apache-container apache'
            }
        }
    }
}
