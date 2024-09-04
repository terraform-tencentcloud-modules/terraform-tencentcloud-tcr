## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_tencentcloud"></a> [tencentcloud](#requirement\_tencentcloud) | >=1.81.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_tencentcloud"></a> [tencentcloud](#provider\_tencentcloud) | >=1.81.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_string.randomname](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [tencentcloud_tcr_instance.foo](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/tcr_instance) | resource |
| [tencentcloud_tcr_namespace.namespaces](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/tcr_namespace) | resource |
| [tencentcloud_tcr_service_account.service_accounts](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/tcr_service_account) | resource |
| [tencentcloud_tcr_token.my_token](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/tcr_token) | resource |
| [tencentcloud_tcr_vpc_attachment.foo](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/tcr_vpc_attachment) | resource |
| [tencentcloud_tcr_instances.name](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/data-sources/tcr_instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_instance"></a> [create\_instance](#input\_create\_instance) | create tcr instance or not | `bool` | `true` | no |
| <a name="input_delete_bucket"></a> [delete\_bucket](#input\_delete\_bucket) | Indicate to delete the COS bucket which is auto-created with the instance or not. | `bool` | `false` | no |
| <a name="input_enable_public_domain_dns"></a> [enable\_public\_domain\_dns](#input\_enable\_public\_domain\_dns) | n/a | `bool` | `false` | no |
| <a name="input_enable_vpc_domain_dns"></a> [enable\_vpc\_domain\_dns](#input\_enable\_vpc\_domain\_dns) | n/a | `bool` | `true` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | TCR types. Valid values are: standard, basic, premium. | `string` | `"basic"` | no |
| <a name="input_namespaces"></a> [namespaces](#input\_namespaces) | namespace map, see `tencentcloud_tcr_namespace` | `any` | `{}` | no |
| <a name="input_open_public_operation"></a> [open\_public\_operation](#input\_open\_public\_operation) | Control public network access | `bool` | `false` | no |
| <a name="input_random_tcr_suffix"></a> [random\_tcr\_suffix](#input\_random\_tcr\_suffix) | tcr name is global uniq. True for a random suffix | `bool` | `false` | no |
| <a name="input_registry_charge_type"></a> [registry\_charge\_type](#input\_registry\_charge\_type) | 1: postpaid; 2: prepaid. | `number` | `1` | no |
| <a name="input_security_policies"></a> [security\_policies](#input\_security\_policies) | white list of IP cidrs for public access. | `list(any)` | `[]` | no |
| <a name="input_service_accounts"></a> [service\_accounts](#input\_service\_accounts) | service\_account map, see `tencentcloud_tcr_service_account` | `any` | `{}` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | subnet id to set endpoint | `string` | `null` | no |
| <a name="input_tcr_id"></a> [tcr\_id](#input\_tcr\_id) | when create\_instance is false, we need an existing tcr id here | `string` | `""` | no |
| <a name="input_tcr_name"></a> [tcr\_name](#input\_tcr\_name) | tcr name | `string` | n/a | yes |
| <a name="input_vpc_attachments"></a> [vpc\_attachments](#input\_vpc\_attachments) | Map of vpc\_attachments to create. vpc\_id is the map key.see `tencentcloud_tcr_vpc_attachment` | `any` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | vpc id to attach | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_ips"></a> [access\_ips](#output\_access\_ips) | n/a |
| <a name="output_service_accounts"></a> [service\_accounts](#output\_service\_accounts) | n/a |
| <a name="output_tcr_id"></a> [tcr\_id](#output\_tcr\_id) | n/a |
| <a name="output_tcr_name"></a> [tcr\_name](#output\_tcr\_name) | n/a |
| <a name="output_token"></a> [token](#output\_token) | n/a |
| <a name="output_user_name"></a> [user\_name](#output\_user\_name) | n/a |
