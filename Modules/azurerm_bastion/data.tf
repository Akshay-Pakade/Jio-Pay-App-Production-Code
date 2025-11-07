data "azurerm_subnet" "subnet" {
  for_each = var.subnet
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "public_ip" {
    for_each = var.public_ip_address
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}