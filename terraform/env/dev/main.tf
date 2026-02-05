module "network_vpc" {
  source = "../../modules/network"
  #Name main var.tf | Name mode var.tf
  vpc_name    = var.vpc_name
  vpc_cidr    = var.vpc_cidr
  private_sub = var.private_sub
  public_sub  = var.public_sub
  az          = var.az
  region = var.aws_region
}

module "key_pair" {
  source = "../../modules/keypair"
  key_name = var.key_name
}