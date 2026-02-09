# VPC outputs
output "vpc_id" {
  description = "VPC ID after creation"
  value       = module.vpc.vpc_id
}

output "private_sub" {
  description = "Private ID after creation"
  value       = module.vpc.private_subnets[0]
}
output "public_sub" {
  description = "Public ID after creation"
  value       = module.vpc.public_subnets[0]
}
