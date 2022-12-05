locals {
  instance_id = var.instance_id != "" ? var.instance_id : concat(tencentcloud_tcr_instance.tcr_instance.*.id, [""])[0]
  namespace_name = var.namespace_name != "" ? var.namespace_name : concat(tencentcloud_tcr_namespace.tcr_namespace.*.name, [""])[0]
  repository_name = var.repository_name != "" ? var.repository_name : concat(tencentcloud_tcr_repository.tcr_repository.*.name, [""])[0]
}

##############################
#         TCR Instance
##############################

resource "tencentcloud_tcr_instance" "tcr_instance" {
  count = var.create && var.create_instance ? 1 : 0
  name                  = var.instance_name
  instance_type         = var.instance_type
  delete_bucket         = var.delete_bucket
  open_public_operation = var.open_public_operation

  dynamic "replications" {
    for_each = var.replications

    content {
        region_id = replications.value.region_id
        syn_tag = lookup(replications.value, "syn_tag", true)
    }
  }

  dynamic "security_policy" {
    for_each = var.security_policies

    content {
      cidr_block  = security_policy.value.cidr_block
      description = lookup(security_policy.value, "description", "")
    }
  }

  tags = var.tags
}

##############################
#         TCR Namespace
##############################

resource "tencentcloud_tcr_namespace" "tcr_namespace" {
  count = var.create && var.create_namespace ? 1 : 0
  instance_id = local.instance_id
  name        = var.namespace_name
  is_public   = var.is_public
}

##############################
#         TCR Repository
##############################

resource "tencentcloud_tcr_repository" "tcr_repository" {
  count = var.create && var.create_repository ? 1 : 0
  instance_id    = local.instance_id
  name           = var.repository_name
  namespace_name = local.namespace_name
  brief_desc     = var.repo_brief_desc
  description    = var.repo_desc
}

##############################
#         TCR Vpc attachment
##############################

resource "tencentcloud_tcr_vpc_attachment" "tcr_vpc_attachment" {
  count = var.create && var.create_vpc_attachment ? 1 : 0
  instance_id = local.instance_id
  vpc_id      = var.vpc_id
  subnet_id   = var.subnet_id
}

##############################
#         TCR Token
##############################

resource "tencentcloud_tcr_token" "tcr_token" {
  count = var.create && var.create_token ? 1 : 0
  instance_id = local.instance_id
  description = var.token_desc
}
