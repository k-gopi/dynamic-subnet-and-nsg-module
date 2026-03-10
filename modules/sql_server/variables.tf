variable "resource_group_name" {
  description = "Resource group name where SQL Server will be deployed"
  type        = string
}

variable "sql_server_name" {
  description = "Name of the Azure SQL Server"
  type        = string
}

variable "sql_admin_username" {
  description = "SQL admin username (pass via environment variable)"
  type        = string
  sensitive   = true
}

variable "sql_admin_password" {
  description = "SQL admin password (pass via environment variable)"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Name of the database to create"
  type        = string
}

variable "location" {
  description = "Azure region for SQL Server"
  type        = string
}

variable "sku_name" {
  description = "SKU for SQL Server Database"
  type        = string
  default     = "Basic"
}

variable "tags" {
  description = "Tags map for resources"
  type        = map(string)
  default     = {}
}
variable "sql_version" {
  description = "Azure SQL Server version"
  type        = string
  default     = "12.0"   # default version
}