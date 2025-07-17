pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
        TF_IN_AUTOMATION   = 'true'
    }

    triggers {
        githubPush() // Trigger pipeline on GitHub push
    }

    options {
        timestamps()
        buildDiscarder(logRotator(numToKeepStr: '5'))
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

        // Optional: Use only for testing
        // stage('Terraform Destroy') {
        //     steps {
        //         sh 'terraform destroy -auto-approve'
        //     }
        // }
    }

}
