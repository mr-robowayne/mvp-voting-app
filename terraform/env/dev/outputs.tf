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

output "vpc_arn" {
  description = "VPC ARN in dev"
  value       = module.network_vpc.vpc_arn
}
output "ssh_key_name" {
  description = "VPC ARN in dev"
  value       = module.key_pair.keypair_name
}
