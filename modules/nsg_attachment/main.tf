# NSG Association
resource "azurerm_subnet_network_security_group_association" "attach" {

  for_each = {
    for k, v in var.subnet_ids :
    k => v
    if k != "appgw-subnet" && k != "AzureFirewallSubnet"
  }

  subnet_id                 = each.value
  network_security_group_id = var.nsg_ids[each.key]

  lifecycle {
    create_before_destroy = true
  }
}