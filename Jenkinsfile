pipeline {
    agent any

    environment {
        // Set the path to the InSpec executable
        INSPEC_PATH = '/opt/chef-workstation/embedded/bin/inspec'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your repository
                git branch: 'main', url: 'https://github.com/skeerthi66/jenkins-pipeline.git'
            }
        }
        stage('Execute InSpec Profile') {
            steps {
                script {
                    // Verify if the InSpec executable exists
                    if (!fileExists(env.INSPEC_PATH)) {
                        error "InSpec executable not found at ${env.INSPEC_PATH}"
                    }
                }
                // Navigate to the controls directory and execute the InSpec profile
                dir('my_compliance_profile/controls') {
                    sh "${env.INSPEC_PATH} exec ."
                }
            }
        }
    }
}
