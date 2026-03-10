resource "azurerm_network_security_group" "appgw" {
  name                = "appgw-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_group" "aks" {
  name                = "aks-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_group" "private_endpoint" {
  name                = "private-endpoint-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}