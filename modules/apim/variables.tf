/*
# ../../modules/apim/variables.tf

variable "apim_name" {
  type        = string
  description = "The name of the API Management instance"
}

variable "publisher_name" {
  type        = string
  description = "The publisher name for the API Management instance"
}

variable "publisher_email" {
  type        = string
  description = "The publisher email for the API Management instance"
}

variable "apim_sku_name" {
  type        = string
  description = "SKU name for API Management. Must be one of: Developer_1, Basic_1, Standard_1, Premium_1"
}

variable "location" {
  type        = string
  description = "Azure region for the APIM instance"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name for APIM"
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the APIM instance"
  default     = {}
}

variable "virtual_network_type" {
  type        = string
  description = "Type of VNET integration (None, External, Internal)"
  default     = "None"
}
*/