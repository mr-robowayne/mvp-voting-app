# VPC outputs
output "vpc_id" {
  description = "ID after creation"
  value       = module.vpc.vpc_id
}
output "vpc_arn" {
  description = "vpc ressource arn"
  value       = module.vpc.vpc_arn
}
output "vpc_name" {
  description = "vpc ressource name"
  value       = module.vpc.name
}
output "private_sub" {
  description = "ID after creation"
  value       = module.vpc.private_subnets[0]
}
output "public_sub" {
  description = "ID after creation"
  value       = module.vpc.public_subnets[0]
}
