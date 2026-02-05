# source module: 
# https://registry.terraform.io/modules/terraform-aws-modules/key-pair/aws/latest

module "key_pair" {
  source             = "terraform-aws-modules/key-pair/aws"
  version            = "~> 2.0"
  key_name           = var.key_name
  create_private_key = true
}