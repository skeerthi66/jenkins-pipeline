pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from Git
                checkout scm
            }
        }

        stage('Install InSpec') {
            steps {
                script {
                    // Check if InSpec is installed, otherwise install it
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'
                    if (!fileExists(inspecPath)) {
                        echo 'InSpec not found, installing...'
                        sh '''
                        curl -L https://omnitruck.chef.io/install.sh | bash -s -- -P inspec
                        '''
                    } else {
                        echo 'InSpec already installed.'
                    }
                }
            }
        }

        stage('Execute InSpec Profile') {
            steps {
                script {
                    // Path to your InSpec profile
                    def profilePath = '/path/to/your/profile'

                    // Execute the InSpec profile
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'
                    if (fileExists(inspecPath)) {
                        sh "${inspecPath} exec ${profilePath}"
                    } else {
                        error "InSpec executable not found at ${inspecPath}"
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
