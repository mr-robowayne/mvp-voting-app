variable "aws_region" {
  type        = string
  description = "AWS region for this environment"
}

variable "vpc_name" { type = string }
variable "vpc_cidr" { type = string }
variable "private_sub" { type = string }
variable "public_sub" { type = string }
variable "az" {type = string}
