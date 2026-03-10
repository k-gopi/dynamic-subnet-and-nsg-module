resource "azurerm_subnet_network_security_group_association" "attach" {

  for_each = var.subnet_ids

  subnet_id                 = each.value
  network_security_group_id = var.nsg_ids[each.key]

}