/**
 * Copyright 2020 Tencent Cloud, LLC
 *
 * Licensed under the Mozilla Public License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.mozilla.org/en-US/MPL/2.0/
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "region" {
  description = "The region for resources"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID for the VPC attachment"
  type        = string
}

variable "subnet_id" {
  description = "The Subnet ID for the VPC attachment."
  type        = string
}

variable "namespaces" {
  description = "The list of namespaces to be created"
  type        = list(map(any))
}

variable "repositories" {
  description = "The list of repository to be created"
  type        = list(map(any))
}

variable "name" {
  description = "The TCR instance name"
  type        = string
}

variable "instance_type" {
  description = "The TCR instance type"
  type        = string
  default     = "basic"
}

variable "open_public_operation" {
  description = "Whether this TCR instance is public accessible"
  type        = bool
  default     = true
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

variable "token_desc" {
  description = "The description for TCR token"
  type        = string
  default     = ""
}
