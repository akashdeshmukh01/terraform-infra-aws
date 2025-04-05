pipeline {
    agent any

    parameters {
        choice(name: 'TF_ENV', choices: ['dev', 'prod'], description: 'Select environment to deploy')
    }

    environment {
        AWS_REGION = 'us-east-1'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out code..."
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                echo "Initializing Terraform..."
                sh 'terraform init'
            }
        }

        stage('Terraform Format & Validate') {
            steps {
                echo "Formatting and Validating Terraform..."
                sh 'terraform fmt -check'
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                echo "Running Terraform Plan..."
                sh "terraform plan -var-file=${params.TF_ENV}.tfvars -out=tfplan"
            }
        }

        stage('Approval') {
            steps {
                script {
                    input(
                        message: "Do you want to apply the Terraform plan?",
                        ok: "Yes, apply it",
                        submitter: 'akash' // Optional: restrict to specific user
                    )
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                echo "Applying Terraform Plan..."
                sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Terraform Output') {
            steps {
                echo "Fetching Terraform Outputs..."
                sh '''
                    terraform output | tee output.txt
                    echo "Output saved to output.txt"
                '''
            }
        }
    }

    post {
        success {
            echo "Terraform pipeline completed successfully"
            archiveArtifacts artifacts: 'output.txt', onlyIfSuccessful: true
        }
        failure {
            echo "Terraform pipeline failed"
        }
    }
}

