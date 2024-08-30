pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Check InSpec Installation') {
            steps {
                script {
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'
                    
                    // Check if InSpec is installed
                    def inspecInstalled = sh(script: "command -v ${inspecPath}", returnStatus: true) == 0

                    if (!inspecInstalled) {
                        error "InSpec is not installed. Please install InSpec manually on the Jenkins server."
                    } else {
                        echo "InSpec is already installed."
                    }
                }
            }
        }

        stage('Execute InSpec Profile') {
            steps {
                script {
                    def profilePath = 'controls'
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'

                    // Execute the InSpec profile
                    sh "${inspecPath} exec ${profilePath} --chef-license=accept"
                }
            }
        }
    }
}
