pipeline {
    agent any

    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Select Terraform action')
        choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Environment to target')
        booleanParam(name: 'CLEANUP_LOCAL_FILES', defaultValue: false, description: 'Clean up .terraform and .tfstate files after destroy')
    }

    environment {
        TF_VAR_FILE = "environments/${params.ENV}/${params.ENV}.tfvars"
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

        stage('Terraform Format Check') {
            steps {
                sh 'terraform fmt -check -recursive'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan & Apply') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        sh "terraform plan -var-file=${TF_VAR_FILE}"

                        // Approval step after plan
                        def userInput = input(
                            id: 'ApplyApproval',
                            message: "Terraform plan completed. Do you want to proceed with apply?",
                            ok: 'Apply',
                            parameters: [
                                text(name: 'Approval Notes', defaultValue: '', description: 'Optional notes before applying Terraform')
                            ]
                        )

                        sh "terraform apply -auto-approve -var-file=${TF_VAR_FILE}"
                    } else if (params.ACTION == 'destroy') {
                        sh "terraform destroy -auto-approve -var-file=${TF_VAR_FILE}"
                    } else {
                        error "Invalid action: ${params.ACTION}"
                    }
                }
            }
        }

        stage('Export Terraform Output (JSON)') {
            when {
                expression { return params.ACTION == 'apply' }
            }
            steps {
                sh 'terraform output -json > tf_outputs.json'
                archiveArtifacts artifacts: 'tf_outputs.json', fingerprint: true
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

