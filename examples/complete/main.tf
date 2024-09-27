locals {
  region = "ap-nanjing"
  azs = ["ap-nanjing-1"]
  vpc_name = "test-nat-gateway"
  vpc_cidr = "10.0.0.0/16"
  subnet_name = "test-nat-gateway"
  subnet_cidrs = ["10.0.0.0/24"]

  tcr_name = "test-tcr-aiopuxy"
  tags = {
    created: "terraform"
  }
}


module "vpc" {
  source  = "terraform-tencentcloud-modules/vpc/tencentcloud"
  version = "1.1.0"
  vpc_name = local.vpc_name
  vpc_cidr = local.vpc_cidr

  subnet_name = local.subnet_name
  subnet_cidrs = local.subnet_cidrs
  availability_zones = local.azs

}

module "tcr" {
  source                = "../../modules/complete"
  create_instance = true
  tcr_name              = local.tcr_name
  delete_bucket         = true
  open_public_operation = true
  security_policies     = [{
    cidr_block:"0.0.0.0/0"
  }]
  instance_type   = "basic"
  vpc_attachments = {
    default = {
      vpc_id                   = module.vpc.vpc_id
      subnet_id                = module.vpc.subnet_id[0]
      enable_vpc_domain_dns    = true
      enable_public_domain_dns = true
    }
  }
  namespaces = {
    images = {
      name                = "images"
      is_public           = false
      is_auto_scan        = false
      is_prevent_vul      = false
      severity            = null // "medium"  // Block vulnerability level, currently only supports low, medium, high.
      cve_whitelist_items = []
    }
  }

  service_accounts = {
    sa1 = {
      name        = "sa1"
      permissions = [
        {
          namespace = "*"
          actions   = [
            "tcr:PushRepository",
            "tcr:CreateHelmChart",
            "tcr:CreateRepository",
            "tcr:PullRepository",
            "tcr:DescribeHelmCharts"
          ]
        }
      ]
      description = ""
      duration    = 365
      disable     = false
      tags        = local.tags
    }

  }
}