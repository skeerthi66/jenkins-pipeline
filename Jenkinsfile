pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Install InSpec') {
            steps {
                script {
                    // Path to your InSpec installation script
                    def inspecInstallScript = '/opt/chef-workstation/embedded/bin/inspec'

                    // Check if InSpec is installed
                    if (!fileExists(inspecInstallScript)) {
                        echo "InSpec not found, installing..."
                        sh '''
                        curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
                        '''
                    } else {
                        echo "InSpec already installed."
                    }
                }
            }
        }

        stage('Execute InSpec Profile') {
            steps {
                script {
                    // Path to your InSpec profile
                    def profilePath = 'controls'

                    // Path to InSpec executable
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'

                    // Execute the InSpec profile
                    if (fileExists(inspecPath)) {
                        sh "${inspecPath} exec ${profilePath}"
                    } else {
                        error "InSpec executable not found at ${inspecPath}"
                    }
                }
            }
        }
    }
}
