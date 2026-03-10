# -----------------------------
# Resource Group
# -----------------------------
module "rg" {
  source   = "../../modules/resource_group"
  name     = "${var.project}-${var.environment}-rg"
  location = var.location
  tags     = var.tags
}

# -----------------------------
# VNet
# -----------------------------
module "vnet" {

  source = "../../modules/vnet"

  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = module.rg.resource_group_name
  dns_servers         = var.dns_servers
  tags                = var.tags
}
# -----------------------------
# Subnets
# -----------------------------
module "subnets" {

  source = "../../modules/subnets"

  subnets             = var.subnets
  vnet_name           = module.vnet.vnet_name
  resource_group_name = module.rg.resource_group_name

  depends_on = [module.vnet]   # ⭐ IMPORTANT
}

# -----------------------------
# Monitoring
# -----------------------------
module "monitoring" {
  source = "../../modules/monitoring"

  log_analytics_workspace_name     = var.log_analytics_workspace_name
  log_analytics_sku                = var.log_analytics_sku
  log_analytics_retention_in_days  = var.log_analytics_retention_in_days

  application_insights_name        = var.application_insights_name
  application_type                 = var.application_type
  appinsights_retention_in_days    = var.appinsights_retention_in_days

  location            = var.location
  resource_group_name = module.rg.resource_group_name

  tags = var.tags
}

# -----------------------------
# Storage
# -----------------------------
module "storage" {
  source = "../../modules/storage"

  storage_account_name            = var.storage_account_name
  container_name                  = var.container_name
  resource_group_name = module.rg.resource_group_name
  location                        = var.location
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  delete_retention_days           = var.delete_retention_days
  container_delete_retention_days = var.container_delete_retention_days

  tags = var.tags
}

# -----------------------------
# SQL Server
# -----------------------------
module "sql_server" {
  source              = "../../modules/sql_server"
  resource_group_name = module.rg.resource_group_name
  sql_server_name     = var.sql_server_name
  sql_admin_username  = var.sql_admin_username
  sql_admin_password  = var.sql_admin_password
  database_name       = var.database_name
  location            = var.location
  sku_name            = var.sku_name
  sql_version         = var.sql_version
  tags                = var.tags
}

# -----------------------------
# NSGs
# -----------------------------
module "nsg" {
  source              = "../../modules/nsg"
  subnets             = var.subnets
  location            = var.location
  resource_group_name = module.rg.resource_group_name
}

# -----------------------------
# NSG Attachment
# -----------------------------
module "nsg_attachment" {
  source     = "../../modules/nsg_attachment"
  subnet_ids = module.subnets.subnet_ids
  nsg_ids    = module.nsg.nsg_ids
}