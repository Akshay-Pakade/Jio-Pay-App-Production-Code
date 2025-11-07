module "resource_group" {
  source = "../../Modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "stg_account" {
  source    = "../../Modules/azurerm_storage_account"
  mystorage = var.mystorage
}

module "vnet" {
  depends_on = [module.resource_group]
  source     = "../../Modules/azurerm_virtual_network"
  networks   = var.networks
}

module "public_ip_address" {
  depends_on = [module.resource_group]
  source     = "../../Modules/azurerm_public_ip"
  public_ip  = var.public_ip
}

module "virtual_machine" {
  depends_on = [module.resource_group, module.vnet, module.public_ip_address,module.keyvault,module.keyvault_secret]
  source     = "../../Modules/azurerm_virtual_machine"
  vms        = var.vms

}


module "nsg" {
  depends_on = [module.resource_group]
  source     = "../../Modules/azurerm_nsg"
  nsg        = var.nsg
}

# module "bastion_host" {
#   depends_on        = [module.resource_group, module.vnet]
#   source            = "../../Modules/azurerm_bastion"
#   bastion_host      = var.bastion_host
#   subnet            = var.subnet
#   public_ip_address = var.public_ip_address
# }
module "mssql_server" {
  depends_on  = [module.resource_group]
  source      = "../../Modules/azurem_mssql_server"
  sql_servers = var.sql_servers
}

module "mssql_database" {
  depends_on   = [module.resource_group, module.mssql_server]
  source       = "../../Modules/azurerm_mssql_database"
  sql_database = var.sql_database
  server_data  = var.server_data
}

module "keyvault" {
  depends_on = [module.resource_group]
  source     = "../../Modules/azurerm_key_vault"
  keyvault   = var.keyvault
}

module "keyvault_secret" {
  depends_on = [ module.resource_group, module.keyvault ]
  source = "../../Modules/azurerm_keyvault_secret"
  kvs    = var.kvs
}
