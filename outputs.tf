output "instance_id" {
  description = "The TCR instance ID."
  value       = concat(tencentcloud_tcr_instance.tcr_instance.*.id, [""])[0]
}

output "instance_name" {
  description = "The TCR instance name."
  value       = concat(tencentcloud_tcr_instance.tcr_instance.*.name, [""])[0]
}

output "namespace_name" {
  description = "The TCR namespace name."
  value       = concat(tencentcloud_tcr_namespace.tcr_namespace.*.name, [""])[0]
}

output "repository_name" {
  description = "The TCR repository name."
  value       = concat(tencentcloud_tcr_repository.tcr_repository.*.id, [""])[0]
}

output "repository_url" {
  description = "The TCR repository url."
  value       = concat(tencentcloud_tcr_repository.tcr_repository.*.url, [""])[0]
}

output "token_id" {
  description = "The TCR token id."
  value       = concat(tencentcloud_tcr_token.tcr_token.*.token_id, [""])[0]
}

output "vpc_access_ip" {
  description = "IP address of the TCR vpc attachment."
  value       = concat(tencentcloud_tcr_vpc_attachment.tcr_vpc_attachment.*.access_ip, [""])[0]
}
