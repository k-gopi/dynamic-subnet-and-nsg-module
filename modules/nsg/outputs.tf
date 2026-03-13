output "nsg_ids" {
  description = "Map of subnet names to NSG IDs"
  value = {
    for subnet, nsg in azurerm_network_security_group.nsg :
    subnet => nsg.id
  }
}