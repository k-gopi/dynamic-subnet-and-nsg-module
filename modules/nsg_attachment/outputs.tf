output "nsg_association_ids" {
  description = "IDs of subnet and NSG associations"

  value = {
    for k, v in azurerm_subnet_network_security_group_association.attach :
    k => v.id
  }
}