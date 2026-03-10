variable "log_analytics_workspace_name" {
  description = "Log Analytics Workspace Name"
  type        = string
}

variable "log_analytics_sku" {
  description = "Log Analytics SKU"
  type        = string
}

variable "log_analytics_retention_in_days" {
  description = "Log Analytics retention days"
  type        = number
}

variable "application_insights_name" {
  description = "Application Insights Name"
  type        = string
}

variable "application_type" {
  description = "Application Insights application type"
  type        = string
}

variable "appinsights_retention_in_days" {
  description = "Application Insights retention days"
  type        = number
}


variable "location" {
  description = "Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}

