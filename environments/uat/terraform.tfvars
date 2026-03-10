# -----------------------------
# Environment / RG variables
# -----------------------------
project     = "fis"
environment = "uat"
location    = "centralindia"

tags = {
  Project     = "fis",
  Environment = "uat",
  ManagedBy   = "Terraform",
  Owner       = "devops-team",
  CostCenter  = "IT-Operations"
}

# -----------------------------
# VNet
# -----------------------------
vnet_name          = "fis-uat-vnet"
vnet_address_space = ["10.0.0.0/16"]
dns_servers        = []

# -----------------------------
# Subnets
# -----------------------------
subnets = {
  aks             = { cidr = "10.0.1.0/24" },
  appgw           = { cidr = "10.0.2.0/24" },
  private_endpoint = { cidr = "10.0.3.0/24" },
  db_endpoint     = { cidr = "10.0.4.0/24" }
}

# -----------------------------
# Monitoring
# -----------------------------
log_analytics_workspace_name    = "uat-law"
log_analytics_sku               = "PerGB2018"
log_analytics_retention_in_days = 30

application_insights_name       = "uat-appinsights"
application_type                = "web"
appinsights_retention_in_days   = 30

# -----------------------------
# Storage
# -----------------------------
storage_account_name            = "uatstorage123"
container_name                  = "appdata"
account_tier                    = "Standard"
account_replication_type        = "LRS"
delete_retention_days           = 7
container_delete_retention_days = 7

# -----------------------------
# SQL
# -----------------------------
sql_server_name    = "fis-uat-sqlserver"
sql_admin_username = "sqladminuser"
sql_admin_password = "StrongPassword123!"
database_name      = "fis_uat_db"
sku_name           = "Basic"
sql_version        = "12.0"

# -----------------------------
# Private Endpoints
# -----------------------------
private_endpoints = {
  sql_pe = {
    name          = "sql-uat-pe",
    resource_type = "sql",
    subnet_name   = "private_endpoint"
  },
  storage_pe = {
    name          = "storage-uat-pe",
    resource_type = "storage",
    subnet_name   = "private_endpoint"
  },
  
}
# Optional: override default DNS zone names
sql_dns_zone_name     = "privatelink.database.windows.net"
storage_dns_zone_name = "privatelink.blob.core.windows.net"