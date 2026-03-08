variable "log_analytics_workspace_name" {
  description = "Log Analytics Workspace Name"
  type        = string
}

variable "application_insights_name" {
  description = "Application Insights Name"
  type        = string
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