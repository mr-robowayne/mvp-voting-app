
variable "instance_type" { type = string }
variable "public_subnet_id" { type = string }
variable "private_subnet_id" { type = string }
variable "key_name" { type = string }
variable "frontend_name" { type = string }
variable "backend_name" { type = string }
variable "db_name" { type = string }
variable "bastion_name" { default = "bastion" }
variable "sg_map" { type = map(string) }
