pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                // Checkout the repository containing the Jenkinsfile
                checkout scm
            }
        }

        stage('Install InSpec') {
            steps {
                script {
                    // Path to InSpec executable
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'

                    // Verify if InSpec is installed
                    if (fileExists(inspecPath)) {
                        echo "InSpec found at ${inspecPath}"
                    } else {
                        echo "InSpec not found, installing..."
                        // Install InSpec
                        sh '''
                        curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
                        '''
                    }
                }
            }
        }

        stage('Execute InSpec Profile') {
            steps {
                script {
                    // Path to your InSpec profile
                    def profilePath = "${workspace}/controls"

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

   
