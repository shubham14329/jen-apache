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
        stage("Copying to apache") {
            steps {
                sh """
                sudo cp /var/lib/jenkins/workspace/jen-apache1/*.html /var/www/html/
                """
            }
        }
    }
}
