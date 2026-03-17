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

variable "sql_version" {
  type    = string
  default = "12.0"
}

variable "sql_sku_name" {      # <-- replaces edition
  type    = string
  default = "Basic"
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}