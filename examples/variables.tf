variable "region" {
  description = "The region for resources"
  type        = string
  default     = "na-siliconvalley"
}

variable "tcr_name" {
  description = "The TCR instance name"
  type        = string
  default     = "tcr-siliconvalley1-jliao"
}

variable "tcr_instance_type" {
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

variable "tcr_tags" {
  description = "The tags for this TCR instance"
  type        = map(string)
  default = {
    created_by = "jliao"
    bu         = "nasa"
  }
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

variable "namespaces" {
  description = "The namespaces created in this TCR instance"
  type        = list(map(any))
  default = [
    {
      name      = "init-demo1"
      is_public = false
    },
    {
      name      = "init-demo2"
      is_public = false
    }
  ]
}

variable "repositories" {
  description = "The repositories created in this TCR instance"
  type        = list(map(string))
  default = [
    {
      namespace_name = "init-demo1"
      name           = "demo_repo1"
      brief_desc     = "Test repository"
      description    = "This is a testing repository"
    },
    {
      namespace_name = "init-demo2"
      name           = "demo_repo2"
      brief_desc     = "Test repository"
      description    = "This is a testing repository"
    },
    {
      namespace_name = "init-demo1"
      name           = "demo_repo3"
      brief_desc     = "Test repository"
      description    = "This is a testing repository"
    }
  ]
}
