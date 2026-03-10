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
  location            = var.location
  resource_group_name = module.rg.rg_name

  address_space = var.vnet_address_space
  dns_servers   = var.dns_servers

  tags = var.tags
}

# -----------------------------
# Subnets
# -----------------------------
module "subnets" {
  source              = "../../modules/subnets"
  resource_group_name = module.rg.rg_name
  vnet_name           = module.vnet.vnet_name
  subnets             = var.subnets
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
  resource_group_name = module.rg.rg_name

  tags = var.tags
}

# -----------------------------
# Storage
# -----------------------------
module "storage" {
  source = "../../modules/storage"

  storage_account_name            = var.storage_account_name
  container_name                  = var.container_name
  resource_group_name             = module.rg.rg_name
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
  resource_group_name = module.rg.rg_name
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
  resource_group_name = module.rg.rg_name
  location            = var.location
  nsgs                = var.nsgs
  tags                = var.tags
}

# -----------------------------
# NSG Attachment
# -----------------------------
module "nsg_attach" {
  source = "../../modules/nsg_attachment"

  nsg_subnet_map = {
    aks = {
      nsg_id    = module.nsg.nsgs["aks"]
      subnet_id = module.subnets.aks_subnet_id
    }
    appgw = {
      nsg_id    = module.nsg.nsgs["appgw"]
      subnet_id = module.subnets.appgw_subnet_id
    }
    private_endpoint = {
      nsg_id    = module.nsg.nsgs["private_endpoint"]
      subnet_id = module.subnets.private_endpoint_subnet_id
    }
  }
}
