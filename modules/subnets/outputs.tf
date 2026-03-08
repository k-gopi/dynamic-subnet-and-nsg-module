output "subnet_ids" {

  value = {
    for subnet_key, subnet in azurerm_subnet.subnet :
    subnet_key => subnet.id
  }

}