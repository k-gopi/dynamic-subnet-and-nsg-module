output "sql_private_dns_zone_id" {
  description = "SQL Private DNS Zone ID"
  value       = azurerm_private_dns_zone.sql.id
}

output "storage_private_dns_zone_id" {
  description = "Storage Private DNS Zone ID"
  value       = azurerm_private_dns_zone.storage.id
}

output "sql_private_dns_zone_link_id" {
  description = "SQL Private DNS Zone VNet Link ID"
  value       = azurerm_private_dns_zone_virtual_network_link.sql_link.id
}

output "storage_private_dns_zone_link_id" {
  description = "Storage Private DNS Zone VNet Link ID"
  value       = azurerm_private_dns_zone_virtual_network_link.storage_link.id
}