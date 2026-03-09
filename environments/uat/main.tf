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

  log_analytics_workspace_name = var.log_analytics_workspace_name
  log_analytics_sku            = var.log_analytics_sku
  log_analytics_retention_in_days = var.log_analytics_retention_in_days

  application_insights_name    = var.application_insights_name
  application_type             = var.application_type
  appinsights_retention_in_days = var.appinsights_retention_in_days

  location            = var.location
  resource_group_name = module.rg.rg_name

  tags = var.tags
}

module "storage" {
  source = "../../modules/storage"

  storage_account_name          = var.storage_account_name
  container_name                = var.container_name
  resource_group_name           = module.rg.rg_name
  location                      = var.location
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  delete_retention_days         = var.delete_retention_days
  container_delete_retention_days = var.container_delete_retention_days
  tags                          = var.tags
}
