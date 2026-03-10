output "nsgs" {
  value = {
    aks             = azurerm_network_security_group.aks.id
    appgw           = azurerm_network_security_group.appgw.id
    private_endpoint= azurerm_network_security_group.private_endpoint.id
  }
}