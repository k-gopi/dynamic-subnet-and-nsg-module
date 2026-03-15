resource "azurerm_route_table" "this" {
  name                = var.route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  route {
    name           = var.route_name
    address_prefix = var.address_prefix
    next_hop_type  = var.next_hop_type

    # Set only if using VirtualAppliance
    next_hop_in_ip_address = var.next_hop_type == "VirtualAppliance" ? var.next_hop_ip : null
  }
}

resource "azurerm_subnet_route_table_association" "this" {
  subnet_id      = var.aks_subnet_id
  route_table_id = azurerm_route_table.this.id
}