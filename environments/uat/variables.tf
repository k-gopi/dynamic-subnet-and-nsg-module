#rg
variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}

#vnet
variable "vnet_address_space" {
  type = list(string)
}
#subnet

variable "subnets" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
}