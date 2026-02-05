module "network_vpc" {
  source = "../../modules/network"
  vpc_name    = var.vpc_name
  vpc_cidr    = var.vpc_cidr
  private_sub = var.private_sub
  public_sub  = var.public_sub
  az          = var.az
  region      = var.aws_region
}

module "key_pair" {
  source   = "../../modules/keypair"
  key_name = var.key_name
}

module "app_instances" {
  source            = "../../modules/compute"
  instance_type     = var.instance_type
  public_subnet_id  = var.public_sub
  private_subnet_id = var.private_sub
  key_name          = module.key_pair.key_pair_name
  frontend_name     = var.frontend_name
  backend_name      = var.backend_name
  db_name           = var.db_name
  depends_on        = [module.network_vpc, module.key_pair]
}
