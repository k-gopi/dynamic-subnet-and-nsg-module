variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
}