output "instance_ids" {
  description = "EC2 instance ids by role"
  value       = { for k, v in module.ec2_instance : k => v.id }
}

output "public_ips" {
  description = "Public IPs by role (frontend & Bastion will have one other will be null)"
  value       = { for k, v in module.ec2_instance : k => v.public_ip }
}

output "private_ips" {
  description = "Private EC2IPs"
  value       = { for k, v in module.ec2_instance : k => v.private_ip }
}
output "frontend_public_ip" {
  description = "Frontend public IP"
  value       = try(module.ec2_instance[var.frontend_name].public_ip, null)
}
