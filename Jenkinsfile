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
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'

                    echo "Checking if InSpec is installed at ${inspecPath}..."

                    // Check if the InSpec executable exists at the specific path
                    def inspecExecutable = sh(script: "which ${inspecPath}", returnStatus: true)

                    if (inspecExecutable == 0) {
                        echo "InSpec found at ${inspecPath}"
                        // Replace with a simple "Hello, World!" output for testing
                        sh "${inspecPath} --version" // This is just to ensure InSpec runs; you can replace this with your actual command
                        echo "Hello, World!"
                    } else {
                        // If InSpec is not found, throw an error
                        error "InSpec executable not found at ${inspecPath}."
                    }
                }
            }
        }
    }
}
