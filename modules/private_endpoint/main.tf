resource "azurerm_private_endpoint" "pe" {
  for_each            = var.private_endpoints
  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnets[each.value.subnet_name]

  private_service_connection {
    name                           = "${each.value.name}-psc"
    is_manual_connection           = false
    private_connection_resource_id = (
      each.value.resource_type == "sql"     ? var.sql_server_id :
      each.value.resource_type == "storage" ? var.storage_account_id :
      ""
    )
    subresource_names = (
      each.value.resource_type == "sql"     ? ["sqlServer"] :
      each.value.resource_type == "storage" ? ["blob"] :
      []
    )
  }
}