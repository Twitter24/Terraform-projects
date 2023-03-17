locals {
  owners = var.engr
  environment = var.environment
  name = "${var.environment}-${var.engr}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
}