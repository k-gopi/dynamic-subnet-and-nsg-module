variable "subnets" {
  description = "Map of subnet names and CIDR"
  type = map(object({
    cidr = string
  }))
}

variable "vnet_name" {}
variable "resource_group_name" {}