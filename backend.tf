terraform {
  backend "s3" {
    bucket         = "my-terraform-infra-state-bucket-001"
    key            = "infra/terraform.tfstate"
    region         = "ap-south-1"
    profile        = "default"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
