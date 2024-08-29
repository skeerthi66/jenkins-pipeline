pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Checking out code...'
                checkout scm
            }
        }

        stage('Unit Test') {
            steps {
                echo 'Performing unit tests...'
                sh 'kitchen test'
            }
        }

        stage('Deployable Bundle Creation') {
            steps {
                echo 'Creating Deploy Bundle...'
                sh 'chef install Policyfile.rb'
                sh 'cat Policyfile.lock.json'
            }
        }

        stage('Compliance Check') {
            steps {
                echo 'Running InSpec compliance checks...'
                sh 'inspec exec compliance/my_profile'
            }
        }

        stage('Deploy Approval') {
            steps {
                timeout(time: 15, unit: 'MINUTES') {
                    input message: 'Do you want to approve the deployment?', ok: 'Yes'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh 'chef push prod Policyfile.lock.json'
                sh 'knife ssh "name:web_server" "sudo chef-client" -a cloud.public_ipv4 -x ubuntu'
            }
        }
    }

    post {
        failure {
            echo 'Build failed! Sending email notification...'
            mail to: 'youremail@example.com',
                 subject: "Build Failed: ${currentBuild.fullDisplayName}",
                 body: "The Jenkins build failed. Please review the logs at ${env.BUILD_URL}."
        }
    }
}
