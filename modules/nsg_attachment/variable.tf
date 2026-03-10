variable "nsg_subnet_map" {
  description = "Map of NSG IDs to Subnet IDs for association"
  type = map(object({
    nsg_id    = string
    subnet_id = string
  }))
}