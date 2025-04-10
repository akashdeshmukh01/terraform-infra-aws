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
            when {
                expression { return params.ACTION == 'apply' }
            }
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Format Check') {
            when {
                expression { return params.ACTION == 'apply' }
            }
            steps {
                sh 'terraform fmt -check -recursive'
            }
        }

        stage('Terraform Validate') {
            when {
                expression { return params.ACTION == 'apply' }
            }
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan & Apply') {
            when {
                expression { return params.ACTION == 'apply' }
            }
            steps {
                script {
                    sh "terraform plan -var-file=${TF_VAR_FILE}"

                    def userInput = input(
                        id: 'ApplyApproval',
                        message: "Terraform plan completed. Do you want to proceed with apply?",
                        ok: 'Apply',
                        parameters: [
                            text(name: 'Approval Notes', defaultValue: '', description: 'Optional notes before applying Terraform')
                        ]
                    )

                    sh "terraform apply -auto-approve -var-file=${TF_VAR_FILE}"
                }
            }
        }

        stage('Terraform Destroy') {
            when {
                expression { return params.ACTION == 'destroy' }
            }
            steps {
                sh "terraform init" // still required before destroy
                sh "terraform destroy -auto-approve -var-file=${TF_VAR_FILE}"
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
