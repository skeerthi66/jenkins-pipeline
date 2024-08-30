pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Verify InSpec Installation') {
            steps {
                script {
                    // Path to the InSpec executable
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'

                    // Check if the InSpec executable exists
                    if (fileExists(inspecPath)) {
                        echo 'InSpec found.'
                    } else {
                        error "InSpec executable not found at ${inspecPath}"
                    }
                }
            }
        }

        stage('Execute InSpec Profile') {
            steps {
                script {
                    // Path to your InSpec profile
                    def profilePath = '/home/chefadmin/my_compliance_profile/controls'

                    // Path to the InSpec executable
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'

                    // Check if the InSpec executable exists
                    if (fileExists(inspecPath)) {
                        echo 'Executing InSpec profile...'
                        sh "${inspecPath} exec ${profilePath}"
                    } else {
                        error "InSpec executable not found at ${inspecPath}"
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
