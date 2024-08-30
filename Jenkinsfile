pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your repository
                git branch: 'main', url: 'https://github.com/skeerthi66/jenkins-pipeline.git'
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
