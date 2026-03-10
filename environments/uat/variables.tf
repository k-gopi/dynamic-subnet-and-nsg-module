# -----------------------------
# Resource Group related variables
# -----------------------------

variable "project" {
  type        = string
  description = "RG name construct cheyyadaniki use avutundi, example: fis-uat-rg"
}

variable "environment" {
  type        = string
  description = "Environment identify cheyyadaniki (dev / uat / prod). RG name lo use avutundi"
}

variable "location" {
  type        = string
  description = "Azure region for RG, VNET, Storage, Monitoring etc."
}

# -----------------------------
# VNET related variables
# -----------------------------

variable "vnet_name" {
  type        = string
  description = "Virtual Network name, example: fis-uat-vnet"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "VNET CIDR range, example: [10.0.0.0/16]"
}

variable "dns_servers" {
  type        = list(string)
  description = "Custom DNS servers, empty list ante Azure default DNS use avutundi"
}

#subnets

# -----------------------------
# Subnets
# -----------------------------
variable "subnets" {
  description = "Subnets for the VNet"
  type = map(object({
    name           = string
    address_prefix = string
  }))
}



# -----------------------------
# Storage Module Variables
# -----------------------------

variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
}

variable "container_name" {
  description = "Blob Container Name"
  type        = string
}

variable "account_tier" {
  description = "Storage Account Tier (Standard / Premium)"
  type        = string
}

variable "account_replication_type" {
  description = "Storage Account Replication Type (LRS / GRS / ZRS / RAGRS)"
  type        = string
}

variable "delete_retention_days" {
  description = "Blob delete retention policy in days"
  type        = number
}

variable "container_delete_retention_days" {
  description = "Container delete retention policy in days"
  type        = number
}
# Log Analytics

variable "log_analytics_workspace_name" {
  type = string
}

variable "log_analytics_sku" {
  type = string
}

variable "log_analytics_retention_in_days" {
  type = number
}

# Application Insights

variable "application_insights_name" {
  type = string
}

variable "application_type" {
  type = string
}

variable "appinsights_retention_in_days" {
  type = number
}


# sql_server

variable "sql_server_name" {
  type        = string
}

variable "sql_admin_username" {
  description = "SQL admin username (env var)"
  type        = string
  sensitive   = true
}

variable "sql_admin_password" {
  description = "SQL admin password (env var)"
  type        = string
  sensitive   = true
}

variable "database_name" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "Basic"
}
variable "sql_version" {
  description = "Azure SQL Server version"
  type        = string
  default     = "12.0"   # default version if nothing passed from tfvars
}

# -----------------------------
# NSG variables
# -----------------------------
variable "nsgs" {
  type = map(object({
    name           = string
    location       = string
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}


# -----------------------------
# NSG IDs attachement (from modules/nsg outputs)
# -----------------------------
variable "nsg_attachments" {
  description = "Map of NSG names to subnet names for attachment"
  type = map(string)
  default = {}
}

variable "appgw_nsg_id" {
  type        = string
  description = "App Gateway NSG ID"
}

variable "aks_nsg_id" {
  type        = string
  description = "AKS NSG ID"
}

variable "private_endpoint_nsg_id" {
  type        = string
  description = "Private Endpoint NSG ID"
}

# -----------------------------
# Subnet IDs (from modules/subnets outputs)
# -----------------------------
variable "appgw_subnet_id" {
  type        = string
  description = "App Gateway Subnet ID"
}

variable "aks_subnet_id" {
  type        = string
  description = "AKS Subnet ID"
}

variable "private_endpoint_subnet_id" {
  type        = string
  description = "Private Endpoint Subnet ID"
}
# -----------------------------
# Common tags (All resources)
# -----------------------------

variable "tags" {
  description = "Common tags applied to RG, VNET, Storage, Monitoring, etc."
  type        = map(string)
}
/*
variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    name           = string
    address_prefix = string
  }))
}
*/