output "nsg_attachment_ids" {
  value = [for assoc in azurerm_subnet_network_security_group_association.this : assoc.id]
}