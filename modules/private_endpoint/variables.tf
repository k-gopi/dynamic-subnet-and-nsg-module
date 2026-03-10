# -----------------------------
# Module Variables
# -----------------------------

variable "private_endpoints" {
  description = "Private Endpoints for SQL / Storage / DB"
  type = map(object({
    name          = string
    resource_type = string # "sql" or "storage" or "db"
    subnet_name   = string
  }))
}

variable "subnets" {
  description = "Map of subnet IDs from parent module"
  type        = map(string)
}

variable "sql_server_id" {
  description = "SQL Server ID for private endpoint"
  type        = string
}

variable "sql_db_id" {
  description = "SQL Database ID for private endpoint"
  type        = string
}

variable "storage_account_id" {
  description = "Storage Account ID for private endpoint"
  type        = string
}

variable "vnet_name" {
  description = "VNet Name"
  type        = string
}

variable "location" {
  description = "Region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}