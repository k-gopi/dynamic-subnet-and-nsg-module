project     = "fis"
environment = "uat"
location    = "centralindia"

vnet_name = "fis-uat-vnet"

vnet_address_space = ["10.0.0.0/16"]
dns_servers       = []

subnets = {
  aks = {
    name           = "aks-subnet"
    address_prefix = "10.0.1.0/24"
  }
  appgw = {
    name           = "appgw-subnet"
    address_prefix = "10.0.2.0/24"
  }
  private_endpoint = {
    name           = "private-endpoint-subnet"
    address_prefix = "10.0.3.0/24"
  }
}
log_analytics_workspace_name      = "uad-law"
log_analytics_sku                 = "PerGB2018"
log_analytics_retention_in_days   = 30

application_insights_name         = "uad-appinsights"
application_type                  = "web"
appinsights_retention_in_days     = 30

storage_account_name              = "uatstorage123"
container_name                    = "appdata"
account_tier                      = "Standard"
account_replication_type          = "LRS"
delete_retention_days             = 7
container_delete_retention_days   = 7

sql_server_name                   = "fis-uat-sqlserver"
database_name                     = "fis_uat_db"
sku_name                          = "Basic"
sql_version                        = "12.0"

nsgs = {
  appgw = {
    name     = "appgw-nsg"
    location = "centralindia"
    security_rules = [
      {
        name                       = "allow-http"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }

  aks = {
    name     = "aks-nsg"
    location = "centralindia"
    security_rules = [
      {
        name                       = "allow-aks"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }

  private_endpoint = {
    name     = "private-endpoint-nsg"
    location = "centralindia"
    security_rules = [
      {
        name                       = "allow-private"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

tags = {
  Project     = "fis"
  Environment = "uat"
  ManagedBy   = "Terraform"
  Owner       = "devops-team"
  CostCenter  = "IT-Operations"
}