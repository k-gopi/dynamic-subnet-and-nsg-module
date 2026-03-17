#################################
# Route Table
#################################
resource "azurerm_route_table" "this" {
  name                = var.route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

#################################
# Default Route (AKS → Firewall / Internet)
#################################
resource "azurerm_route" "default" {
  name                = var.route_name
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.this.name
  address_prefix      = var.address_prefix
  next_hop_type       = var.next_hop_type

  # ✅ Only when using Firewall
  next_hop_in_ip_address = var.next_hop_type == "VirtualAppliance" ? var.next_hop_ip : null
}

#################################
# Private Endpoint Bypass (SQL + Storage same subnet)
#################################
resource "azurerm_route" "private_endpoint_bypass" {
  name                = "private-endpoint-bypass"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.this.name

  address_prefix = var.db_subnet_cidr   # 👉 10.0.3.0/24
  next_hop_type  = "VnetLocal"
}

#################################
# Subnet Association (AKS)
#################################
resource "azurerm_subnet_route_table_association" "aks" {
  subnet_id      = var.aks_subnet_id
  route_table_id = azurerm_route_table.this.id
}