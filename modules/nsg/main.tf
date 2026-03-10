resource "azurerm_network_security_group" "nsg" {

  for_each = var.subnets

  name                = "${each.key}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}