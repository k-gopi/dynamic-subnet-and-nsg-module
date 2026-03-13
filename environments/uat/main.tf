################################################
# Resource Group
################################################
module "rg" {
  source   = "../../modules/resource_group"
  name     = var.custom_rg_name  # <-- your custom name here
  location = var.location
  tags     = var.tags
}

################################################
# VNet
################################################
module "vnet" {
  source = "../../modules/vnet"

  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = module.rg.resource_group_name
  dns_servers         = var.dns_servers
  tags                = var.tags
}

################################################
# Subnets
################################################
module "subnets" {
  source = "../../modules/subnets"

  subnets             = var.subnets
  vnet_name           = module.vnet.vnet_name
  resource_group_name = module.rg.resource_group_name

  depends_on = [module.vnet]
}

################################################
# Monitoring
################################################
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
  tags                = var.tags
}

################################################
# Storage
################################################
module "storage" {
  source = "../../modules/storage"

  storage_account_name            = var.storage_account_name
  container_name                  = var.container_name
  resource_group_name             = module.rg.resource_group_name
  location                        = var.location
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  delete_retention_days           = var.delete_retention_days
  container_delete_retention_days = var.container_delete_retention_days

  tags = var.tags
}

################################################
# SQL Server
################################################
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

################################################
# NSGs
################################################
module "nsg" {
  source              = "../../modules/nsg"
  subnets             = var.subnets
  nsg_rules           = var.nsg_rules
  location            = var.location
  resource_group_name = module.rg.resource_group_name
  tags                = var.tags
  subnet_ids          = module.subnets.subnet_ids
  nsg_ids    = module.nsg.nsg_ids
}

################################################
# NSG Attachment
################################################
module "nsg_attachment" {
  source     = "../../modules/nsg_attachment"
  subnet_ids = module.subnets.subnet_ids
  nsg_ids    = module.nsg.nsg_ids
}

################################################
# Private Endpoints
################################################
module "private_endpoint" {
  source              = "../../modules/private_endpoint"
  private_endpoints   = var.private_endpoints
  vnet_name           = module.vnet.vnet_name
  subnets             = module.subnets.subnet_ids
  sql_server_id       = module.sql_server.sql_server_id
  sql_db_id           = module.sql_server.database_id
  storage_account_id  = module.storage.storage_account_id
  location            = var.location
  resource_group_name = module.rg.resource_group_name
}

################################################
# Private DNS Zones
################################################
module "private_dns" {
  source              = "../../modules/private_dns"
  project             = var.project
  environment         = var.environment
  resource_group_name = module.rg.resource_group_name
  vnet_id             = module.vnet.vnet_id
  tags                = var.tags
}

################################################
# AKS + Application Gateway
################################################
module "aks_module" {
  source = "../../modules/aks"

  location            = var.location
  resource_group_name = module.rg.resource_group_name

  aks_subnet_id   = module.subnets.subnet_ids["aks-subnet"]
  appgw_subnet_id = module.subnets.subnet_ids["appgw-subnet"]

  appgw_name          = var.appgw_name
  appgw_sku_name      = var.appgw_sku_name
  appgw_sku_tier      = var.appgw_sku_tier
  appgw_capacity      = var.appgw_capacity
  appgw_frontend_port = var.appgw_frontend_port
  appgw_private_ip    = var.appgw_private_ip

  aks_cluster_name        = var.aks_cluster_name
  dns_prefix              = var.dns_prefix

  system_nodepool_name    = var.system_nodepool_name
  system_nodepool_vm_size = var.system_nodepool_vm_size
  system_nodepool_min     = var.system_nodepool_min
  system_nodepool_max     = var.system_nodepool_max

  user_nodepool_name      = var.user_nodepool_name
  user_nodepool_vm_size   = var.user_nodepool_vm_size
  user_nodepool_min       = var.user_nodepool_min
  user_nodepool_max       = var.user_nodepool_max

  service_cidr   = var.service_cidr
  dns_service_ip = var.dns_service_ip

  tags = var.tags
}