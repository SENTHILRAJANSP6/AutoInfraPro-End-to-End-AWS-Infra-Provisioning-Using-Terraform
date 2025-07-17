pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'      // Update to your region
        TF_IN_AUTOMATION   = 'true'
    }

    triggers {
        githubPush()  // Trigger pipeline on git push
    }

    options {
        timestamps()       // Add timestamps to logs
        buildDiscarder(logRotator(numToKeepStr: '5')) // Keep only last 5 builds
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/SENTHILRAJANSP6/AutoInfraPro-End-to-End-AWS-Infra-Provisioning-Using-Terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan.out'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan.out'
            }
        }

        stage('Terraform Destroy') {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }

    post {
        success {
            mail to: 'senthilrajansp@gmail.com',
                 subject: "✅ Jenkins Build #${env.BUILD_NUMBER} Succeeded: ${env.JOB_NAME}",
                 body: """Hi Senthil,

The Jenkins pipeline **${env.JOB_NAME}** has completed **SUCCESSFULLY**.

Build Details:
- Build Number: ${env.BUILD_NUMBER}
- GitHub Repo: https://github.com/SENTHILRAJANSP6/AutoInfraPro-End-to-End-AWS-Infra-Provisioning-Using-Terraform.git
- Jenkins Job: ${env.BUILD_URL}

Regards,
Jenkins CI/CD Bot"""
        }

        failure {
            mail to: 'senthilrajansp@gmail.com',
                 subject: "❌ Jenkins Build #${env.BUILD_NUMBER} Failed: ${env.JOB_NAME}",
                 body: """Hi Senthil,

The Jenkins pipeline **${env.JOB_NAME}** has **FAILED**.

Build Details:
- Build Number: ${env.BUILD_NUMBER}
- GitHub Repo: https://github.com/SENTHILRAJANSP6/AutoInfraPro-End-to-End-AWS-Infra-Provisioning-Using-Terraform.git
- Jenkins Job: ${env.BUILD_URL}

Please check the logs for more details.

Regards,
Jenkins CI/CD Bot"""
        }
    }
}
