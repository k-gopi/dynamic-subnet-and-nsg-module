# -----------------------------
# Environment / RG variables
# -----------------------------
variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}
variable "custom_rg_name" {
  type        = string
  description = "Custom name for the resource group"
}

# -----------------------------
# VNet
# -----------------------------
variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "dns_servers" {
  type = list(string)
}

# -----------------------------
# Subnets
# -----------------------------
variable "subnets" {
  description = "Subnets with CIDR"
  type = map(object({
    cidr = string
  }))
}

# -----------------------------
# NSG
# -----------------------------
variable "nsg_rules" {
  description = "NSG rules for each subnet"

  type = map(list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  })))

  default = {}
}

# -----------------------------
# Monitoring
# -----------------------------
variable "log_analytics_workspace_name" {
  type = string
}

variable "log_analytics_sku" {
  type = string
}

variable "log_analytics_retention_in_days" {
  type = number
}

variable "application_insights_name" {
  type = string
}

variable "application_type" {
  type = string
}

variable "appinsights_retention_in_days" {
  type = number
}

# -----------------------------
# Storage
# -----------------------------
variable "storage_account_name" {
  type = string
}

variable "container_name" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "delete_retention_days" {
  type = number
}

variable "container_delete_retention_days" {
  type = number
}

# -----------------------------
# SQL
# -----------------------------
variable "sql_server_name" {
  type = string
}

variable "sql_admin_username" {
  type      = string
  sensitive = true
}

variable "sql_admin_password" {
  type      = string
  sensitive = true
}

variable "database_name" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "Basic"
}

variable "sql_version" {
  type    = string
  default = "12.0"
}

# -----------------------------
# Private Endpoints
# -----------------------------
variable "private_endpoints" {
  description = "Private Endpoints for SQL / Storage"
  type = map(object({
    name          = string
    resource_type = string
    subnet_name   = string
  }))
}

variable "sql_dns_zone_name" {
  description = "Private DNS Zone name for SQL"
  type        = string
  default     = "privatelink.database.windows.net"
}

variable "storage_dns_zone_name" {
  description = "Private DNS Zone name for Storage"
  type        = string
  default     = "privatelink.blob.core.windows.net"
}

# -----------------------------
# AKS + Application Gateway
# -----------------------------
variable "appgw_name" {
  type = string
}

variable "appgw_sku_name" {
  type = string
}

variable "appgw_sku_tier" {
  type = string
}

variable "appgw_capacity" {
  type = number
}

variable "appgw_frontend_port" {
  type = number
}

variable "appgw_private_ip" {
  type = string
}

variable "aks_cluster_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "system_nodepool_name" {
  type = string
}

variable "system_nodepool_vm_size" {
  type = string
}

variable "system_nodepool_min" {
  type = number
}

variable "system_nodepool_max" {
  type = number
}

variable "system_nodepool_os_disk_size_gb" {
  type = number
}

variable "user_nodepool_name" {
  type = string
}

variable "user_nodepool_vm_size" {
  type = string
}

variable "user_nodepool_min" {
  type = number
}

variable "user_nodepool_max" {
  type = number
}

variable "user_nodepool_os_disk_size_gb" {
  type = number
}

variable "service_cidr" {
  type = string
}

variable "dns_service_ip" {
  type = string
}

# -----------------------------
# routetable
# -----------------------------

variable "route_table_name" {
  description = "Name of the AKS Route Table"
  type        = string
}

variable "route_name" {
  description = "Route name inside the route table"
  type        = string
}

variable "address_prefix" {
  description = "Destination address prefix for the route"
  type        = string
}

variable "next_hop_type" {
  description = "Next hop type (VirtualAppliance, Internet, VnetLocal, None)"
  type        = string
}

variable "next_hop_ip" {
  description = <<EOT
IP of OnPrem firewall or NVA.
Only required if next_hop_type is 'VirtualAppliance'.
Leave empty if not using a VirtualAppliance.
EOT
  type    = string
  default = ""
}

#variable "location" {
 # description = "Azure region where the route table will be created"
  #type        = string
#}

#variable "resource_group_name" {
 # description = "Resource group where the route table will be created"
  #type        = string
#}

variable "aks_subnet_id" {
  description = "Subnet ID to associate with the route table"
  type        = string
}

##variable "tags" {
  #description = "Tags to apply to the route table"
  #type        = map(string)
  #default     = {}
#}