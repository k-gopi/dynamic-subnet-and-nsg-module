
/*
resource "azurerm_api_management" "this" {
  name                 = var.apim_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  publisher_name       = var.publisher_name
  publisher_email      = var.publisher_email

  sku_name = var.apim_sku_name   # Only SKU, no capacity attribute

  tags                 = var.tags
  virtual_network_type = var.virtual_network_type
}
*/