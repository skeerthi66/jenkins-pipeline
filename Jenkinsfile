pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your repository
                git 'https://github.com/skeerthi66/jenkins-pipeline.git'
            }
        }
        stage('Install InSpec') {
            steps {
                // Install InSpec if not already installed
                sh 'curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec'
            }
        }
        stage('Execute InSpec Profile') {
            steps {
                // Navigate to the controls directory and execute the InSpec profile
                dir('my_compliance_profile/controls') {
                    sh '/opt/chef-workstation/embedded/bin/inspec exec .'
                }
            }
        }
    }
}
