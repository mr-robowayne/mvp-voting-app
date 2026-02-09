#module source:
#https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  for_each = toset([var.frontend_name, var.backend_name, var.db_name, var.bastion_name])

  name          = "instance-${each.key}"
  instance_type = var.instance_type
  key_name      = var.key_name
  
  # Module Input - sets frontend instance & bastion in the public subnet others in the private subnet
  subnet_id = contains( [var.bastion_name, var.frontend_name],each.key) ? var.public_subnet_id : var.private_subnet_id

  # Module Input - assign a public IP address only to the frontend & bastion instance
  associate_public_ip_address = contains([var.bastion_name, var.frontend_name],each.key)
  vpc_security_group_ids = [
    each.key == var.bastion_name  ? var.sg_map[var.bastion_name]  :
    each.key == var.frontend_name ? var.sg_map[var.frontend_name] :
    each.key == var.backend_name  ? var.sg_map[var.backend_name]  :
    var.sg_map[var.db_name]
  ]

  
  
  tags = {
    Name = each.key
  }

}
