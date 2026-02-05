# source code: 
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"
  name    = var.vpc_name
  cidr    = var.vpc_cidr
  azs             = [var.az]
  private_subnets = [var.private_sub]
  public_subnets  = [var.public_sub]
}