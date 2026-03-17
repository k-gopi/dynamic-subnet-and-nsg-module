resource "azurerm_subnet" "subnet" {
  for_each = var.subnets

  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [each.value.cidr]

  # App Gateway delegation only for appgw-subnet
  dynamic "delegation" {
    for_each = each.key == "appgw-subnet" ? [1] : []
    content {
      name = "appgw-delegation"

      service_delegation {
        name = "Microsoft.Network/applicationGateways"

        actions = [
          "Microsoft.Network/virtualNetworks/subnets/action",
          "Microsoft.Network/virtualNetworks/subnets/join/action",
          "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
          "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
        ]
      }
    }
  }
}