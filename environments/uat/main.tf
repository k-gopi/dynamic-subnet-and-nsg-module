module "resource_group" {
  source = "../../modules/resource_group"

  project     = var.project
  environment = var.environment
  location    = var.location
}

module "vnet" {
  source = "../../modules/vnet"

  project             = var.project
  environment         = var.environment
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name

  address_space = var.vnet_address_space
}

module "subnets" {
  source = "../../modules/subnets"

  resource_group_name = module.resource_group.resource_group_name
  vnet_name           = module.vnet.vnet_name

  subnets = var.subnets
}