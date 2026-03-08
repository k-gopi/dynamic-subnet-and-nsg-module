# -----------------------------
# Resource Group related variables
# -----------------------------

variable "project" {
  type = string
  # RG name construct cheyyadaniki use avutundi
  # Example: fis-uat-rg
}

variable "environment" {
  type = string
  # Environment identify cheyyadaniki (dev / uat / prod)
  # RG name lo kuda use avutundi
}

variable "location" {
  type = string
  # RG and VNET create ayye Azure region
}


# -----------------------------
# VNET related variables
# -----------------------------

variable "vnet_name" {
  type = string
  # Virtual Network name
  # Example: fis-uat-vnet
}

variable "vnet_address_space" {
  type = list(string)
  # VNET CIDR range
  # Example: 10.0.0.0/16
}

variable "dns_servers" {
  type = list(string)
  # Custom DNS servers
  # Empty list unte Azure default DNS use avutundi
}

#subnets

variable "subnets" {
  description = "Subnets for the VNet"
  type = map(object({
    name           = string
    address_prefix = string
  }))
}
#############################################
# Monitoring Module Variables
#############################################

variable "log_analytics_workspace_name" {
  description = "Log Analytics Workspace Name"
  type        = string
}

variable "application_insights_name" {
  description = "Application Insights Name"
  type        = string
}
#############################################
# storage Module Variables
#############################################
variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
}

variable "container_name" {
  description = "Blob Container Name"
  type        = string
}

# -----------------------------
# Common tags (All resources)
# -----------------------------

variable "tags" {
  type = map(string)
  # RG, VNET and future resources ki common tags
}