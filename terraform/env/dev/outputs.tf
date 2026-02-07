output "vpc_id" {
  description = "VPC ID in dev"
  value       = module.network_vpc.vpc_id
}

output "private_subnet_id" {
  description = "Private subnet ID in dev"
  value       = module.network_vpc.private_sub
}

output "public_subnet_id" {
  description = "Public subnet ID in dev"
  value       = module.network_vpc.public_sub
}

output "ssh_key_name" {
  description = "SSH key pair name in dev"
  value       = var.key_name
}


