provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "prod_server" {
  instance_type = "t2.micro"
  ami = "ami-0a1235697f4afa8a4"

  tags = {
    name = "product_dev"
  }
}