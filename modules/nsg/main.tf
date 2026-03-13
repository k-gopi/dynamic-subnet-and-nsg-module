################################################
# NSG
################################################
resource "azurerm_network_security_group" "nsg" {
  for_each = var.subnets

  name                = "${each.key}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  timeouts {
    delete = "5m"
  }
}

################################################
# Dynamic NSG Rules
################################################
locals {
  rules = flatten([
    for subnet_name, rules_list in var.nsg_rules : [
      for rule in rules_list : merge(rule, { subnet = subnet_name })
    ]
  ])
}

resource "azurerm_network_security_rule" "rules" {
  for_each = { for r in local.rules : "${r.subnet}-${r.name}" => r }

  name                       = each.value.name
  priority                   = each.value.priority
  direction                  = each.value.direction
  access                     = each.value.access
  protocol                   = each.value.protocol

  source_port_range          = each.value.source_port_range
  destination_port_range     = each.value.destination_port_range

  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg[each.value.subnet].name

  timeouts {
    delete = "5m"
  }

  lifecycle {
    ignore_changes = all # 🔹 Prevent App Gateway V2 inbound rule deletion errors
  }
}