variable "vpc_id" {
  type        = string
  description = "VPC ID where security groups will be created"
}
variable "own_ip_cidr" {
  type        = string
  description = "Your IP in CIDR notation (e.g., 203.0.113.0/24)"
}
variable "bastion_name" { type = string }
variable "frontend_name" { type = string }
variable "backend_name" { type = string }
variable "db_name" { type = string }
