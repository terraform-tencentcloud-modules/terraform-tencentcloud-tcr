locals {
  create_instance = true
  create_namespace = true
  create_repository = true
  create_vpc_attachment = true
}

resource "tencentcloud_vpc" "main" {
  name       = "test-vpc"
  cidr_block = "10.0.0.0/16"
  tags = {
    "createBy" = "terraform"
  }
}

resource "tencentcloud_subnet" "subnet" {
  availability_zone = var.default_az
  name              = "test-subnet"
  vpc_id            = tencentcloud_vpc.main.id
  cidr_block        = "10.0.20.0/28"
  is_multicast      = false
  tags = {
    "createBy" = "terraform"
  }
}
module "tcr" {
  source = "../"

  # TCR instance
  create_instance = local.create_instance
  instance_name                  = var.instance_name
  instance_type         = var.instance_type
  open_public_operation = var.open_public_operation
  security_policies     = var.security_policies
  tags                  = var.tags

  # TCR namespace
  create_namespace = local.create_namespace
  instance_id = var.instance_id
  namespace_name                  = var.namespace_name
  is_public                  = var.is_public

  # TCR repository
  create_repository = local.create_repository
  repository_name = var.repository_name
  repo_brief_desc = var.repo_brief_desc
  repo_desc = var.repo_desc

  # TCR VPC attachment
  create_vpc_attachment = local.create_vpc_attachment
  vpc_id    = tencentcloud_vpc.main.id
  subnet_id = tencentcloud_subnet.subnet.id
}
