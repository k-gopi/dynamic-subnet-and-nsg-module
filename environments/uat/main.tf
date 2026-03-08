module "rg" {
  source   = "../../modules/resource_group"
  name     = "${var.project}-${var.environment}-rg"
  location = var.location
  tags     = var.tags
}

module "vnet" {
  source = "../../modules/vnet"

  name                = var.vnet_name
  location            = var.location
  resource_group_name = module.rg.rg_name

  address_space = var.vnet_address_space
  dns_servers   = var.dns_servers

  tags = var.tags
}

module "subnets" {

  source = "../../modules/subnets"

  resource_group_name = module.rg.rg_name
  vnet_name           = module.vnet.vnet_name

  subnets = var.subnets

}

module "monitoring" {
  source = "../../modules/monitoring"

  log_analytics_workspace_name = "uad-law"
  application_insights_name    = "uad-appinsights"

  location            = var.location
  resource_group_name = module.rg.rg_name

  tags = var.tags
}

module "storage" {
  source = "../../modules/storage"

  storage_account_name = var.storage_account_name
  container_name       = var.container_name

  resource_group_name = module.rg.rg_name
  location            = var.location

  tags = var.tags
}
