pipeline {
    agent any

    stages {
        stage('Initialize') {
            steps {
                echo "Starting the pipeline..."
            }
        }

        stage('Checkout SCM') {
            steps {
                checkout scm
                echo "Code checked out from SCM"
            }
        }

        stage('Setup Environment') {
            steps {
                echo "Setting up the environment..."
                // Add any environment setup commands here
            }
        }

        stage('Execute InSpec Profile') {
            steps {
                script {
                    echo "Hello, World! - InSpec step execution"
                    
                    // Set PATH to include the directory containing InSpec
                  //  withEnv(["PATH+CHEF=/opt/chef-workstation/embedded/bin"]) {
                     //   def inspecExecutable = sh(script: "which ${inspecPath}", returnStatus: true)

                }
            }
        }

        stage('Cleanup') {
            steps {
                echo "Cleaning up after the pipeline..."
                // Add any cleanup commands here
            }
        }
    }

    post {
        always {
            echo "Pipeline execution completed."
        }
    }
}
