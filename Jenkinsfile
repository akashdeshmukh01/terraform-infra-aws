pipeline {
    agent any

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'prod'],
            description: 'Select the environment to deploy to'
        )
    }

    environment {
        TF_VAR_ENV = "${params.ENVIRONMENT}"
    }

    stages {
        stage('Checkout') {
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
                sh 'terraform fmt -check'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var-file=environments/${TF_VAR_ENV}/${TF_VAR_ENV}.tfvars -out=tfplan'
            }
        }

        stage('Approve Apply') {
            steps {
                input message: "Apply changes to ${TF_VAR_ENV} environment?"
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Terraform Output') {
            steps {
                echo "Fetching Terraform Output..."
                sh 'terraform output -json > tf_output.json'
                archiveArtifacts artifacts: 'tf_outputs.json', fingerprint: true
                sh 'cat tf_output.json'
                // You can now parse tf_output.json using a script or pass to next job
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            sh 'rm -f tfplan || true'
        }
    }
}

