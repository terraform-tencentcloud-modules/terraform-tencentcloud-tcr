##############################
#         TCR Instance
##############################

resource "tencentcloud_tcr_instance" "tcr_instance" {
  name                  = var.name
  instance_type         = var.instance_type
  open_public_operation = var.open_public_operation

  dynamic "security_policy" {
    for_each = var.security_policies

    content {
      cidr_block  = security_policy.value.cidr_block
      description = lookup(security_policy.value, "description", "")
    }
  }

  tags = var.tags
}

locals {
  namespaces = {
    for x in var.namespaces :
    "${x.name}" => x
  }

  repositories = {
    for x in var.repositories :
    "${x.name}/${x.namespace_name}" => x
  }
}

resource "tencentcloud_tcr_namespace" "tcr_namespace" {
  for_each    = local.namespaces
  instance_id = tencentcloud_tcr_instance.tcr_instance.id
  name        = each.value.name
  is_public   = lookup(each.value, "is_public", "false")
}

resource "tencentcloud_tcr_repository" "tcr_repo" {
  for_each       = local.repositories
  instance_id    = tencentcloud_tcr_instance.tcr_instance.id
  namespace_name = each.value.namespace_name
  name           = each.value.name
  brief_desc     = lookup(each.value, "brief_desc", "")
  description    = lookup(each.value, "description", "")
}

resource "tencentcloud_tcr_vpc_attachment" "tcr_vpc_attachment" {
  instance_id = tencentcloud_tcr_instance.tcr_instance.id
  vpc_id      = var.vpc_id
  subnet_id   = var.subnet_id
}

resource "tencentcloud_tcr_token" "tcr_token" {
  instance_id = tencentcloud_tcr_instance.tcr_instance.id
  description = var.token_desc
}
