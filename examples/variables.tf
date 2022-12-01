variable "default_az" {
  description = "The avalible zone"
  type        = string
  default     = "ap-guangzhou-3"
}

variable "instance_id" {
  description = "The TCR instance id"
  type        = string
  default     = ""
}

variable "instance_name" {
  description = "The TCR instance name"
  type        = string
  default     = "tcr-siliconvalley1-jliao"
}

variable "instance_type" {
  description = "The TCR instance type"
  type        = string
  default     = "basic"
}

variable "open_public_operation" {
  description = "Allow public access to this TCR instance"
  type        = bool
  default     = true
}

variable "security_policies" {
  description = "The list of security policies"
  type        = list(map(string))
  default = [
    {
      cidr_block  = "98.153.142.170/32"
      description = "JLiao laptop"
    },
    {
      cidr_block  = "10.0.0.0/16"
      description = "VPC private network access"
    }
  ]
}

variable "tags" {
  description = "The tags for this TCR instance"
  type        = map(string)
  default = {
    created_by = "jliao"
    bu         = "nasa"
  }
}

variable "namespace_name" {
  description = "Name of namespaces to be created"
  type        = string
  default = "test-namespace-name"
}

variable "is_public" {
  description = "Indicate that the namespace is public or not"
  type = bool
  default = false
}

variable "repository_name" {
  description = "Name of repository to be created"
  type        = string
  default = "test-repository-name"
}

variable "repo_brief_desc" {
  description = "Brief description of the repository"
  type        = string
  default = "test brief description"
}

variable "repo_desc" {
  description = "Description of the repository"
  type        = string
  default = "test repository description"
}

variable "vpc_id" {
  description = "The optional vpc id"
  default     = "vpc-40xkp1o3"
}

variable "subnet_id" {
  description = "The subnet ID."
  type        = string
  default     = "subnet-pq7krkow"
}
