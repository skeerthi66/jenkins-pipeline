pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                // Check out the source code from the repository
                checkout scm
            }
        }

        stage('Verify InSpec Version') {
            steps {
                script {
                    // Check if InSpec is available and get its version
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'
                    def inspecExecutable = sh(script: "command -v ${inspecPath}", returnStdout: true).trim()
                    
                    if (inspecExecutable) {
                        def inspecVersion = sh(script: "${inspecExecutable} --version", returnStdout: true).trim()
                        echo "Detected InSpec version: ${inspecVersion}"
                    } else {
                        error "InSpec executable not found at ${inspecPath}"
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
                        // Run the InSpec profile
                        sh "${inspecExecutable} exec ${profilePath} --chef-license=accept"
                    } else {
                        error "InSpec executable not found at ${inspecPath}"
                    }
                }
            }
        }
    }
}
