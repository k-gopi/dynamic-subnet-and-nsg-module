output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "appgw_id" {
  value = azurerm_application_gateway.appgw.id
}
output "appgw_private_ip" {
  value = azurerm_application_gateway.appgw.frontend_ip_configuration[0].private_ip_address
}