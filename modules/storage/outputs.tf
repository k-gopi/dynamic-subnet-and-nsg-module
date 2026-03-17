output "storage_account_id" {
  description = "ID of the Storage Account"
  value       = azurerm_storage_account.storage.id
}

output "storage_account_name" {
  description = "Name of the Storage Account"
  value       = azurerm_storage_account.storage.name
}

output "storage_container_id" {
  description = "ID of the Storage Container"
  value       = azurerm_storage_container.container.id
}

output "storage_container_name" {
  description = "Name of the Storage Container"
  value       = azurerm_storage_container.container.name
}