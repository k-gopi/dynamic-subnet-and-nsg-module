# =============================
# Environment / RG variables
# =============================
custom_rg_name = "my-custom-rg"
project     = "fis"
environment = "uat"
location    = "centralindia"

tags = {
  Project     = "fis"
  Environment = "uat"
  ManagedBy   = "Terraform"
  Owner       = "devops-team"
  CostCenter  = "IT-Operations"
}

# =============================
# VNet
# =============================
vnet_name          = "fis-uat-vnet"
vnet_address_space = ["10.0.0.0/16"]
dns_servers        = []

# =============================
# Subnets
# =============================
subnets = {
  aks-subnet        = { cidr = "10.0.1.0/24" }
  appgw-subnet      = { cidr = "10.0.2.0/24" }
  private_endpoint  = { cidr = "10.0.3.0/24" }
  db_endpoint       = { cidr = "10.0.4.0/24" }
}

# =============================
# NSG RULES
# =============================
nsg_rules = {
  "appgw-subnet" = [
    {
      name                       = "Allow-HTTP"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
    },
    {
      name                       = "Allow-HTTPS"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
    },
    {
      name                       = "Allow-AzureLoadBalancer"
      priority                   = 130
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "AzureLoadBalancer"
      destination_address_prefix = "*"
    }
  ]

  "aks-subnet" = [
    {
      name                       = "Allow-AppGW-To-AKS"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "Allow-Kubelet"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "10250"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "Allow-VNet-Inbound"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "Allow-DNS-Outbound"
      priority                   = 130
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "*"
      destination_address_prefix = "AzureDNS"
    },
    {
      name                       = "Allow-Internet-Outbound"
      priority                   = 140
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "Internet"
    }
  ]
}

# =============================
# Monitoring
# =============================
log_analytics_workspace_name    = "uat-law"
log_analytics_sku               = "PerGB2018"
log_analytics_retention_in_days = 30

application_insights_name       = "uat-appinsights"
application_type                = "web"
appinsights_retention_in_days   = 30

# =============================
# Storage
# =============================
storage_account_name            = "uatstorage123"
container_name                  = "appdata"
account_tier                    = "Standard"
account_replication_type        = "LRS"
delete_retention_days           = 7
container_delete_retention_days = 7

# =============================
# SQL
# =============================
sql_server_name    = "fis-uat-sqlserver"
sql_admin_username = "sqladminuser"
sql_admin_password = "StrongPassword123!"
database_name      = "fis_uat_db"
sku_name           = "Basic"
sql_version        = "12.0"

# =============================
# Private Endpoints
# =============================
private_endpoints = {
  sql = {
    name          = "fis-uat-sql-pe"
    resource_type = "sql"
    subnet_name   = "private_endpoint"
  }
  storage = {
    name          = "fis-uat-storage-pe"
    resource_type = "storage"
    subnet_name   = "private_endpoint"
  }
}

# =============================
# AKS
# =============================
aks_cluster_name = "uat-aks-new"
dns_prefix       = "uataks"

system_nodepool_name    = "systemnp"

system_nodepool_min     = 1
system_nodepool_max     = 3

user_nodepool_name    = "usernp"

user_nodepool_min     = 1
user_nodepool_max     = 2

service_cidr   = "172.16.0.0/16"
dns_service_ip = "172.16.0.10"
system_nodepool_vm_size = "Standard_D2s_v3"
user_nodepool_vm_size   = "Standard_D4s_v3"

system_nodepool_os_disk_size_gb = 64
user_nodepool_os_disk_size_gb   = 64
# =============================
# Application Gateway
# =============================
appgw_name          = "uagw-01"
appgw_sku_name      = "Standard_v2"
appgw_sku_tier      = "Standard_v2"
appgw_capacity      = 2
appgw_frontend_port = 80
appgw_private_ip    = "10.0.2.10"

# =============================
# routetable
# =============================


route_table_name      = "uat-aks-route-table"
route_name            = "default-egress"
address_prefix        = "0.0.0.0/0"
next_hop_type         = "Internet"  # VirtualAppliance
next_hop_ip           = ""       # OnPrem firewall/NVA
aks_subnet_id = "/subscriptions/27339cb4-7869-4ef0-b766-ee6720081396/resourceGroups/my-custom-rg/providers/Microsoft.Network/virtualNetworks/fis-uat-vnet/subnets/aks-subnet-subnet"