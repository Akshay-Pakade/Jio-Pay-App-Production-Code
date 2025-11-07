data "azurerm_mssql_server" "servers" {
  for_each            = var.server_data
  name                = each.value.server_name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_mssql_database" "database" {
  for_each = var.sql_database

  name         = each.value.name
  server_id    = data.azurerm_mssql_server.servers[each.value.server_key].id
  collation    = each.value.collation
  max_size_gb  = each.value.max_size_gb
  sku_name        = each.value.sku_name
  license_type = each.value.license_type
  enclave_type = each.value.enclave_type
}
