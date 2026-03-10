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
  description = "Private Endpoints for SQL / Storage / DB"
  type = map(object({
    name          = string
    resource_type = string  # allowed values: "sql", "storage", "db"
    subnet_name   = string
  }))
}
# Optional: override default DNS zone names
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