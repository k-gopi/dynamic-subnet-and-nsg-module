variable "subnets" {
  type        = map(any)
  description = "Map of subnet names to subnet info"
}

variable "nsg_rules" {
  type        = map(list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  })))
  description = "NSG rules per subnet"
}

variable "location" {
  type        = string
  description = "Location of resources"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "tags" {
  type        = map(string)
  description = "Tags for resources"
}

variable "subnet_ids" {
  type        = map(string)
  description = "Map of subnet names to subnet IDs"
}

variable "nsg_ids" {
  type        = map(string)
  description = "Map of subnet names to NSG IDs"
}