pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm credentialsId: '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'
            }
        }

        stage('Verify InSpec Version') {
            steps {
                script {
                    def inspecVersion = sh(script: 'inspec --version', returnStdout: true).trim()
                    echo "Detected InSpec version: ${inspecVersion}"

                    // Add logic here to compare version and potentially install a specific version using package manager (if needed)
                }
            }
        }

        stage('Execute InSpec Profile') {
            steps {
                script {
                    def profilePath = 'controls'
                    def inspecPath = '/opt/chef-workstation/embedded/bin/inspec'

                    def inspecExecutable = sh(script: "command -v ${inspecPath}", returnStdout: true).trim()
                    if (inspecExecutable) {
                        sh "${inspecExecutable} exec ${profilePath} --chef-license=accept"
                    } else {
                        error "InSpec executable not found at ${inspecPath}"
                    }
                }
            }
        }
    }
}
