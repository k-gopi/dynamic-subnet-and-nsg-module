output "aks_subnet_id" {
  value = azurerm_subnet.aks.id
}

output "appgw_subnet_id" {
  value = azurerm_subnet.appgw.id
}

output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoint.id
}