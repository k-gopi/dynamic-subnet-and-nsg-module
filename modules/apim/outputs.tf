output "apim_name" {
  value       = azurerm_api_management.this.name
  description = "API Management service name"
}

output "apim_id" {
  value       = azurerm_api_management.this.id
  description = "API Management service ID"
}

output "apim_url" {
  value       = azurerm_api_management.this.gateway_url
  description = "API Gateway URL"
}