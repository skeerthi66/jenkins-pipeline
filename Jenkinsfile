pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Execute InSpec Profile') {
            steps {
                script {
                    def profilePath = 'controls'
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'

                    echo "Checking if InSpec is installed at ${inspecPath}..."
                    echo "Environment: ${sh(script: 'env', returnStdout: true)}"

                    // Check if the InSpec executable exists
                    def inspecExecutable = sh(script: "which ${inspecPath}", returnStdout: true).trim()

                    if (inspecExecutable) {
                        echo "InSpec found at ${inspecExecutable}"
                        // Print the InSpec version
                        sh "${inspecExecutable} --version"
                        echo "Executing InSpec profile at ${profilePath}..."
                        // Execute the InSpec profile
                        sh "${inspecExecutable} exec ${profilePath} --chef-license=accept"
                    } else {
                        // If InSpec is not found, throw an error
                        error "InSpec executable not found at ${inspecPath}"
                    }
                }
            }
        }
    }
}
