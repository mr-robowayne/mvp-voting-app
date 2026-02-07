variable "aws_region" {
  type        = string
  description = "AWS region for this environment"
}

## VPC / Subnet / IGW autocreate / association autocrete / rt autocreate
variable "vpc_name" { type = string }
variable "vpc_cidr" { type = string }
variable "private_sub" { type = string }
variable "public_sub" { type = string }
variable "az" { type = string }

## ssh key 
variable "key_name" { type = string }
## instances 
variable "instance_type" { type = string }
variable "frontend_name" { type = string }
variable "backend_name" { type = string }
variable "db_name" { type = string }
variable "bastion_name" { type = string }
variable "own_ip_cidr" { type = string }