variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "subnets" {
  description = "Subnets configuration"
  type = map(object({
    name           = string
    address_prefix = string
  }))
}