variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name e.g., uat/dev/prod"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group where DNS Zones will be created"
  type        = string
}

variable "vnet_id" {
  description = "VNet ID to link Private DNS zones"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}