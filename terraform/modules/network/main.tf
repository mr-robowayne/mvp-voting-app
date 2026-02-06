# source code: 
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "~> 5.0"
  name               = var.vpc_name
  cidr               = var.vpc_cidr
  azs                = [var.az]
  private_subnets    = [var.private_sub]
  public_subnets     = [var.public_sub]
  create_igw         = true
  enable_nat_gateway = false


  igw_tags = {
    Name = "${var.vpc_name}-igw"
  }

  public_subnet_tags = {
    Name = "${var.vpc_name}-public-subnet"
  }

  private_subnet_tags = {
    Name = "${var.vpc_name}-private-subnet"
  }

  public_route_table_tags = {
    Name = "${var.vpc_name}-public-rt"
  }

  private_route_table_tags = {
    Name = "${var.vpc_name}-private-rt"
  }


}