variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
}

variable "container_name" {
  description = "Blob Container Name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "account_tier" {
  description = "Storage Account Tier (Standard / Premium)"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Storage Account Replication Type (LRS / GRS / ZRS / RAGRS)"
  type        = string
  default     = "LRS"
}

variable "delete_retention_days" {
  description = "Blob delete retention policy in days"
  type        = number
  default     = 7
}

variable "container_delete_retention_days" {
  description = "Container delete retention policy in days"
  type        = number
  default     = 7
}

variable "tags" {
  description = "Tags applied to resources"
  type        = map(string)
}