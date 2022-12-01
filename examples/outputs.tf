output "instance_id" {
  description = "The TCR instance ID."
  value       = module.tcr.instance_id
}

output "instance_name" {
  description = "The TCR instance name."
  value       = module.tcr.instance_name
}

output "namespace_name" {
  description = "The TCR namespace name."
  value       = module.tcr.namespace_name
}

output "repository_name" {
  description = "The TCR repository name."
  value       = module.tcr.repository_name
}

output "repository_url" {
  description = "The TCR repository url."
  value       = module.tcr.repository_url
}

output "vpc_access_ip" {
  description = "IP address of the TCR vpc attachment."
  value       = module.tcr.vpc_access_ip
}
