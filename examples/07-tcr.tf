
module "tcr" {
  source = "../"

  region = var.region

  # TCR instance
  name                  = var.tcr_name
  instance_type         = var.tcr_instance_type
  open_public_operation = var.open_public_operation
  security_policies     = var.security_policies
  tags                  = var.tcr_tags

  #TCR VPC attachment
  vpc_id    = var.vpc_id
  subnet_id = var.subnet_id

  namespaces   = var.namespaces
  repositories = var.repositories
}
