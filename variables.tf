variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "ap-south-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  default     = "default"
}

variable "instance_name" {
  description = "Name for the EC2 instance"
  default     = "FreeTier-Dev-EC2"
}

variable "key_name" {
  description = "Key pair for SSH access"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}
