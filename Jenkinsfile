pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                git url: 'https://github.com/skeerthi66/jenkins-pipeline.git', branch: 'main'
            }
        }
        stage('Install InSpec') {
            steps {
                script {
                    // Check if InSpec is installed, if not, install it
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'
                    if (!fileExists(inspecPath)) {
                        echo 'InSpec not found, installing...'
                        sh 'curl -L https://omnitruck.chef.io/install.sh | bash -s -- -P inspec'
                    } else {
                        echo 'InSpec is already installed.'
                    }
                }
            }
        }
        stage('Execute InSpec Profile') {
            steps {
                script {
                    // Run the InSpec profile
                    sh '/opt/chef-workstation/embedded/bin/inspec exec /path/to/your/profile'
                }
            }
        }
    }

    post {
        always {
            // Clean up actions or notifications
            echo 'Pipeline completed.'
        }
        success {
            // Actions on successful execution
            echo 'Pipeline succeeded!'
        }
        failure {
            // Actions on failure
            echo 'Pipeline failed.'
        }
    }
}
