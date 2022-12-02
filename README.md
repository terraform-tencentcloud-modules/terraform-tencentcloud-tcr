# TencentCloud TCR for Terraform

## terraform-tencentcloud-tcr

A terraform module used for create TencentCloud Container Registry

These types of resources are supported:

* [tencentcloud_tcr_instance](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/tcr_instance)
* [tencentcloud_tcr_namespace](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/tcr_namespace)
* [tencentcloud_tcr_repository](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/tcr_repository)
* [tencentcloud_tcr_token](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/tcr_token)
* [tencentcloud_tcr_vpc_attachment](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/tcr_vpc_attachment)

## Usage

### Private Repository
```hcl
module "private_tcr" {
  source          = "terraform-tencentcloud-modules/tcr/tencentcloud"

  create_instnace = true
  instance_type   = "Basic"
  instance_name   = "your_instance_name"
  replications = [{
    region_id = 1
    sync_tag = true
  }]
  security_policies = [{
    cidr_block = "10.0.0.1/24"
    description = "your description"
  }]
  tags = {
    Terraform = "true"
    Environment = "dev"
  }

  create_namespace   = true
  namespace_name     = "your_namespace_name"
  is_public = false

  create_repository  = true
  repository_name    = "your_repository_name"
  brief_desc = "your_brief_desc" 
  repo_desc = "your_repository_desc"
}
```

### Public Repository
```hcl
module "public_tcr" {
  source          = "terraform-tencentcloud-modules/tcr/tencentcloud"

  create_instnace = true
  instance_type   = "Basic"
  instance_name   = "your_instance_name"
  open_public_operation = true
  replications = [{
    region_id = 1
    sync_tag = true
  }]
  security_policies = [{
    cidr_block = "10.0.0.1/24"
    description = "your description"
  }]
  tags = {
    Terraform = "true"
    Environment = "dev"
  }

  create_namespace   = true
  namespace_name     = "your_namespace_name"
  is_public = true

  create_repository  = true
  repository_name    = "your_repository_name"
  brief_desc = "your_brief_desc" 
  repo_desc = "your_repository_desc"
}
```

### TCR Vpc attachment
```hcl
module "tcr_vpc_attachment" {
  source          = "terraform-tencentcloud-modules/tcr/tencentcloud"

  create_instnace = true
  instance_type   = "Basic"
  instance_name   = "your_instance_name"
  open_public_operation = true
  replications = [{
    region_id = 1
    sync_tag = true
  }]
  security_policies = [{
    cidr_block = "10.0.0.1/24"
    description = "your description"
  }]
  tags = {
    Terraform = "true"
    Environment = "dev"
  }

  create_namespace   = true
  namespace_name     = "your_namespace_name"
  is_public = true

  create_repository  = true
  repository_name    = "your_repository_name"
  brief_desc = "your_brief_desc" 
  repo_desc = "your_repository_desc"

  create_vpc_attachment = true
  vpc_id = "your_vpc_id" 
  subnet_id = "your_subnet_id"
}
```

### TCR Token
```hcl
module "tcr_token" {
  source          = "terraform-tencentcloud-modules/tcr/tencentcloud"

  create_instnace = true
  instance_type   = "Basic"
  instance_name   = "your_instance_name"
  replications = [{
    region_id = 1
    sync_tag = true
  }]
  security_policies = [{
    cidr_block = "10.0.0.1/24"
    description = "your description"
  }]
  tags = {
    Terraform = "true"
    Environment = "dev"
  }

  create_namespace   = true
  namespace_name     = "your_namespace_name"

  create_repository  = true
  repository_name    = "your_repository_name"
  brief_desc = "your_brief_desc" 
  repo_desc = "your_repository_desc"

  create_token = true
  token_desc = "your_token_desc"
}
```

## Examples

* [complete example](https://github.com/terraform-tencentcloud-modules/terraform-tencentcloud-tcr/tree/main/examples)


## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tencentcloud"></a> [tencentcloud](#provider\_tencentcloud) | >= 1.59.4 |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|create|Determines whether resources will be created (affects all resources)|bool|true|no|
|create_instance|Whether to create the tencentcloud_tcr_instance|bool|false|no|
|create_namespace|Whether to create the tencentcloud_tcr_namespace|bool|false|no|
|create_repository|Whether to create the tencentcloud_tcr_repository|bool|false|no|
|create_vpc_attachment|Whether to create the tencentcloud_tcr_vpc_attachment|bool|false|no|
|create_token|Whether to create the tencentcloud_tcr_token|bool|false|no|
|instance_id|The TCR instance ID|string|`""`|no|
|instance_type|The TCR instance type|string|`basic`|no|
|instance_name|The TCR instance name|string|`null`|no|
|delete_bucket|Whether to delete the COS bucket which is auto-created with instance|bool|false|no|
|open_public_operation|Whether this TCR instance is public accessible|bool|false|no|
|replications|Specify List of instance Replications, premium for instance_type only|list(map(any))|`[]`|no|
|security_policies|The list of security policies|list(map(string))|`[]`|no|
|tags|The tags applied to this TCR instance|map(string)|`{}`|no|
|namespace_name|Name of namespaces to be created|string|`null`|no|
|is_public|Indicate that the namespace is public or not|bool|false|no|
|repository_name|Name of repository to be created|string|`null`|no|
|repo_brief_desc|Brief description of the repository|string|`null`|no|
|repo_desc|Description of the repository|string|`null`|no|
|token_desc|Description of the token|string|`""`|no|
|enable|Indicate to enable this token or not|bool|false|no|
|vpc_id|The VPC ID for the VPC attachment|string|`""`|no|
|subnet_id|The Subnet ID for the VPC attachment|string|`""`|no|
|enable_public_domain_dns|Whether to enable public domain dns|bool|false|no|
|enable_vpc_domain_dns|Whether to enable vpc domain dns|bool|false|no|
|region_name|Name of region|string|`""`|no|

## outputs

| Name | Description |
|------|-------------|
|instance_id|The TCR instance ID|
|instance_name|The TCR instance name|
|namespace_name|The TCR namespace name|
|repository_name|The TCR repository name|
|repository_url|The TCR repository url|
|token_id|The TCR token id|
|vpc_access_ip|IP address of the TCR vpc attachment|
## License

Mozilla Public License Version 2.0.
See LICENSE for full details.
