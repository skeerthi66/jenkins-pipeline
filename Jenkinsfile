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
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'

                    // Check if InSpec is installed
                    def inspecInstalled = sh(script: "command -v ${inspecPath}", returnStatus: true) == 0

                    if (!inspecInstalled) {
                        echo "InSpec not found, installing..."
                        // Handle sudo password prompt
                        sh '''
                        echo "jenkins ALL=(ALL) NOPASSWD: /bin/bash" | sudo EDITOR='tee -a' visudo
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
                    def profilePath = 'controls'
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'

                    def inspecExecutable = sh(script: "command -v ${inspecPath}", returnStdout: true).trim()
                    if (inspecExecutable) {
                        sh "${inspecPath} exec ${profilePath} --chef-license=accept"
                    } else {
                        error "InSpec executable not found at ${inspecPath}"
                    }
                }
            }
        }
    }
}
