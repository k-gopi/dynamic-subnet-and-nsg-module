output "private_endpoint_ids" {
  description = "Map of Private Endpoint IDs"
  value = { for k, v in azurerm_private_endpoint.pe : k => v.id }
}

output "private_endpoint_names" {
  description = "Map of Private Endpoint Names"
  value = { for k, v in azurerm_private_endpoint.pe : k => v.name }
}