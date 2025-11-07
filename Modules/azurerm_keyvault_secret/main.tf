data "azurerm_key_vault" "keyvault" {
  name                ="jio-prod-kvs1"
  resource_group_name =  "rg-jio-pay-app-prod"
}

resource "azurerm_key_vault_secret" "kvsecret" {
    for_each = var.kvs
  name         = each.value.key_vault_secret_name
  value        = each.value.vm_secrets 
  key_vault_id = data.azurerm_key_vault.keyvault.id
}