variable "aws_region" {
  type        = string
  description = "AWS region for this environment"
}

## VPC / Subnet / IGW autocreate / association autocrete / rt autocreate
variable "vpc_name" { type = string }
variable "vpc_cidr" { type = string }
variable "private_sub" { type = string }
variable "public_sub" { type = string }
variable "az" {type = string}

## 
variable "key_name" {type = string}