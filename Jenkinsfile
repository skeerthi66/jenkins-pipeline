pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                git 'https://github.com/skeerthi66/jenkins-pipeline.git'
            }
        }

        stage('Install InSpec') {
            steps {
                script {
                    // Check if InSpec is installed
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'
                    if (!fileExists(inspecPath)) {
                        echo 'InSpec not found, installing...'
                        sh 'curl -L https://omnitruck.chef.io/install.sh | bash -s -- -P inspec'
                    } else {
                        echo 'InSpec found at ${inspecPath}'
                    }
                }
            }
        }

        stage('Debug') {
            steps {
                script {
                    // Print environment variables and paths for debugging
                    sh 'echo $PATH'
                    sh 'which inspec'
                    sh 'ls -l /opt/chef-workstation/embedded/bin/inspec'
                }
            }
        }

        stage('Execute InSpec Profile') {
            steps {
                script {
                    // Define path to your InSpec profile
                    def profilePath = '/home/saikeerthi/my_compliance_profile/controls'
                    
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

        stage('Post Actions') {
            steps {
                echo 'Pipeline completed.'
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed.'
        }
    }
}
