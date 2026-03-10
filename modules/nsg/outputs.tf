output "nsgs" {
  value = {
    appgw            = azurerm_network_security_group.appgw.id
    aks              = azurerm_network_security_group.aks.id
    private_endpoint = azurerm_network_security_group.private_endpoint.id
  }
}