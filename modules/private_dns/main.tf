# -----------------------------
# Private DNS Zones
# -----------------------------
resource "azurerm_private_dns_zone" "sql" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone" "storage" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

# -----------------------------
# VNet Links
# -----------------------------
resource "azurerm_private_dns_zone_virtual_network_link" "sql_link" {
  name                  = "${var.project}-${var.environment}-sql-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.sql.name
  virtual_network_id    = var.vnet_id
  registration_enabled  = false
}

resource "azurerm_private_dns_zone_virtual_network_link" "storage_link" {
  name                  = "${var.project}-${var.environment}-storage-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.storage.name
  virtual_network_id    = var.vnet_id
  registration_enabled  = false
}