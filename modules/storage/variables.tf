variable "storage_account_name" {
  description = "Storage account name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "account_tier" {
  description = "Standard or Premium"
  type        = string
}

variable "account_kind" {
  description = "Storage account kind, usually StorageV2"
  type        = string
}

variable "account_replication_type" {
  description = "LRS, ZRS, GRS etc."
  type        = string
}

variable "access_tier" {
  description = "Hot or Cool"
  type        = string
}

variable "min_tls_version" {
  description = "Minimum TLS version"
  type        = string
}

variable "hns_enabled" {
  description = "Hierarchical namespace (Flat namespace for Blob Storage)"
  type        = bool
}

variable "sftp_enabled" {
  description = "Enable SFTP (true/false)"
  type        = bool
}

variable "delete_retention_days" {
  description = "Number of days to retain deleted blobs"
  type        = number
}

variable "container_delete_retention_days" {
  description = "Number of days to retain deleted containers"
  type        = number
}

variable "container_name" {
  description = "Blob container name"
  type        = string
}

variable "tags" {
  description = "Tags map"
  type        = map(string)
  default     = {}
}

/*variable "estimated_capacity_gb" {
  description = "Estimated storage usage in GB for cost calculation"
  type        = number
  default     = 500
}
*/