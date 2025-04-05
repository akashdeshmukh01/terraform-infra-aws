pipeline {
    agent any

    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Select Terraform action')
        choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Environment to target')
        booleanParam(name: 'CLEANUP_LOCAL_FILES', defaultValue: false, description: 'Clean up .terraform and .tfstate files after destroy')
    }

    environment {
        TF_VAR_FILE = "${params.ENV}.tfvars"
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Action') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        sh "terraform plan -var-file=${TF_VAR_FILE}"
                        sh "terraform apply -auto-approve -var-file=${TF_VAR_FILE}"
                    } else if (params.ACTION == 'destroy') {
                        sh "terraform destroy -auto-approve -var-file=${TF_VAR_FILE}"
                    } else {
                        error "Invalid action: ${params.ACTION}"
                    }
                }
            }
        }

        stage('Cleanup Local Files') {
            when {
                allOf {
                    expression { params.ACTION == 'destroy' }
                    expression { params.CLEANUP_LOCAL_FILES }
                }
            }
            steps {
                sh '''
                    echo "Cleaning up local Terraform files..."
                    rm -rf .terraform terraform.tfstate terraform.tfstate.backup
                '''
            }
        }
    }

    post {
        success {
            echo "Terraform ${params.ACTION} completed successfully."
        }
        failure {
            echo "Terraform ${params.ACTION} failed."
        }
    }
}

