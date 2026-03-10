# -----------------------------
# AKS Subnet
# -----------------------------
resource "azurerm_subnet" "aks" {
  name                 = var.subnets["aks"].name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnets["aks"].address_prefix]
}

# -----------------------------
# Application Gateway Subnet
# -----------------------------
resource "azurerm_subnet" "appgw" {
  name                 = var.subnets["appgw"].name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnets["appgw"].address_prefix]
}

# -----------------------------
# Private Endpoint Subnet
# -----------------------------
resource "azurerm_subnet" "private_endpoint" {
  name                 = var.subnets["private_endpoint"].name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnets["private_endpoint"].address_prefix]
}

