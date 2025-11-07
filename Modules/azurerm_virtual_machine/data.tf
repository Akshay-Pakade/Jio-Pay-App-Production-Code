data "azurerm_subnet" "subnet" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "public_ip" {
  for_each            = var.vms
  name                = each.value.ip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "keyvault" {

  name                = "jio-prod-kvs1"
  resource_group_name = "rg-jio-pay-app-prod"
}

data "azurerm_key_vault_secret" "username" {
  name         = "secret-username"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "secret-password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

