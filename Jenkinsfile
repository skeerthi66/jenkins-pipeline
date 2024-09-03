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

                    // Check if the InSpec executable exists
                    def inspecExecutable = sh(script: "which ${inspecPath} || which inspec", returnStdout: true).trim()

                    if (inspecExecutable) {
                        echo "InSpec found at ${inspecExecutable}"
                        // Output "Hello, World!" instead of running the InSpec profile
                        echo "Hello, World!"
                    } else {
                        // If InSpec is not found, throw an error
                        error "InSpec executable not found at ${inspecPath}"
                    }
                }
            }
        }
    }
}
