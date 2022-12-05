variable "create" {
  description = "Determines whether resources will be created (affects all resources)"
  type = bool
  default = true
}

variable "create_instance" {
  description = "Whether to create the tencentcloud_tcr_instance"
  type = bool
  default = true
}

variable "create_namespace" {
  description = "Whether to create the tencentcloud_tcr_namespace"
  type = bool
  default = false
}

variable "create_repository" {
  description = "Whether to create the tencentcloud_tcr_repository"
  type = bool
  default = false
}

variable "create_vpc_attachment" {
  description = "Whether to create the tencentcloud_tcr_vpc_attachment"
  type = bool
  default = false
}

variable "create_token" {
  description = "Whether to create the tencentcloud_tcr_token"
  type = bool
  default = false
}

variable "instance_id" {
  description = "The TCR instance ID"
  type        = string
  default = ""
}

##################################################
# Instance
##################################################

variable "instance_type" {
  description = "The TCR instance type"
  type        = string
  default     = "basic"
}

variable "instance_name" {
  description = "The TCR instance name"
  type        = string
  default = null
}

variable "delete_bucket" {
  description = "Whether to delete the COS bucket which is auto-created with instance"
  type = bool
  default = false
}

variable "open_public_operation" {
  description = "Whether this TCR instance is public accessible"
  type        = bool
  default     = false
}

variable "replications" {
  description = "Specify List of instance Replications, premium for instance_type only"
  type = list(map(any))
  default = []
}

variable "security_policies" {
  description = "The list of security policies"
  type        = list(map(string))
  default     = []
}

variable "tags" {
  description = "The tags applied to this TCR instance"
  type        = map(string)
  default     = {}
}

##################################################
# Namespace
##################################################

variable "namespace_name" {
  description = "Name of namespaces to be created"
  type        = string
  default = null
}

variable "is_public" {
  description = "Indicate that the namespace is public or not"
  type = bool
  default = false
}

##################################################
# Repository
##################################################

variable "repository_name" {
  description = "Name of repository to be created"
  type        = string
  default = null
}

variable "repo_brief_desc" {
  description = "Brief description of the repository"
  type        = string
  default = null
}

variable "repo_desc" {
  description = "Description of the repository"
  type        = string
  default = null
}

##################################################
# Token
##################################################

variable "token_desc" {
  description = "Description of the token"
  type        = string
  default = ""
}

variable "enable" {
  description = "Indicate to enable this token or not"
  type        = bool
  default = false
}

##################################################
# Vpc attachment
##################################################

variable "vpc_id" {
  description = "The VPC ID for the VPC attachment"
  type        = string
  default = ""
}

variable "subnet_id" {
  description = "The Subnet ID for the VPC attachment."
  type        = string
  default = ""
}

variable "enable_public_domain_dns" {
  description = "Whether to enable public domain dns"
  type        = bool
  default = false
}

variable "enable_vpc_domain_dns" {
  description = "Whether to enable vpc domain dns"
  type        = bool
  default = false
}

variable "region_name" {
  description = "Name of region"
  type        = string
  default     = ""
}
