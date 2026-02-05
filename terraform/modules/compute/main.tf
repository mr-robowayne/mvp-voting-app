#module source:
#https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  for_each = toset([var.frontend_name, var.backend_name, var.db_name])

  name          = "instance-${each.key}"
  instance_type = var.instance_type
  key_name      = var.key_name

  # module input - sets frontend instance in the public subnet others in the private subnet
  subnet_id = each.key == var.frontend_name ? var.public_subnet_id : var.private_subnet_id
  # module input - assign a public IP address only to the frontend instance
  associate_public_ip_address = each.key == var.frontend_name

  tags = {
    Name = each.key
  }

}
