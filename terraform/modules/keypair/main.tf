# source module: 
# https://registry.terraform.io/modules/terraform-aws-modules/key-pair/aws/latest

module "key_pair" {
  source             = "terraform-aws-modules/key-pair/aws"
  version            = "~> 2.0"
  key_name           = var.key_name

  
# We disable private key generation because Terraform would store it in state.
# Instead, we provide an existing public key from a local file.
  create_private_key = false 
  public_key = file(var.public_key) 
}