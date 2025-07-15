module "ec2" {
  source        = "./modules/ec2_instance"
  instance_name = var.instance_name
  #key_name         = var.key_name
  aws_region         = var.aws_region
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
}

