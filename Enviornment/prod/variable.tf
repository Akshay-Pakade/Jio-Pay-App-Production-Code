variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}


variable "mystorage" {
  type = map(object({
    name                              = string
    location                          = string
    resource_group_name               = string
    account_tier                      = string
    account_replication_type          = string
    provisioned_billing_model_version = optional(string)
    cross_tenant_replication_enabled  = optional(bool)
    access_tier                       = optional(string)
    edge_zone                         = optional(string)
    https_traffic_only_enabled        = optional(bool)
    min_tls_version                   = optional(string)
    allow_nested_items_to_be_public   = optional(bool)
    shared_access_key_enabled         = optional(bool)
    public_network_access_enabled     = optional(bool)
    default_to_oauth_authentication   = optional(bool)
    is_hns_enabled                    = optional(bool)
    nfsv3_enabled                     = optional(bool)
    large_file_share_enabled          = optional(bool)
    local_user_enabled                = optional(bool)
    queue_encryption_key_type         = optional(string)
    table_encryption_key_type         = optional(string)
    infrastructure_encryption_enabled = optional(bool)
    allowed_copy_scope                = optional(string)
    sftp_enabled                      = optional(bool)
    dns_endpoint_type                 = optional(string)
    tags                              = optional(map(string))
    network_rule = optional(object({
      default_action = string
      bypass         = optional(list(string))
      ip_rules       = optional(list(string))
    }))
  }))
}

variable "networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnet = optional(map(object({
      name             = string
      address_prefixes = list(string)
    })))
  }))
}

variable "public_ip" {
  type = map(object(
    {
      name                = string
      resource_group_name = string
      location            = string
      allocation_method   = string
    }
  ))
}

# variable "vms" {

  
#   type = map(object({
#     subnet_name         = string
#     vnet_name           = string
#     resource_group_name = string
#     ip_name             = string
#     nic_name            = string
#     location = string
#     vm_name = string
#     size = string
#     admin_username = string
#     admin_password = string
#      os_disk = object({
#       caching              = string
#       storage_account_type = string
#     })
#     source_image_reference = object({
#       publisher = string
#       offer     = string
#       sku       = string
#       version   = string
#     })
#   }
#     ))
#     }
variable "vms" {
  type = map(object({
    subnet_name         = string
    vnet_name           = string
    resource_group_name = string
    ip_name             = string
    nic_name            = string
    location = string
    vm_name = string
    size = string
    # admin_username = string
    # admin_password = string
    # keyvault_name = string
    # kvsecret_name = string
     os_disk = object({
      caching              = string
      storage_account_type = string
    })
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }
    ))
    }



variable "nsg" {
type = map(object({
  name = string
  location = string
  resource_group_name = string
  security_rule = map(object({
    name = string
    direction = string 
    access = string
    priority = number
    protocol = string
    source_port_range = string
    destination_port_range = string
    source_address_prefix = string
    destination_address_prefix = string
  }))
}))

}

variable "bastion_host" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
     subnet_key = string
    public_key = string
  }))
}

variable "sql_servers" {
  description = "A map of SQL Server configurations"
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login_password = optional(string)
    minimum_tls_version          = optional(string)
    administrator_login          = optional(string)
    azuread_administrator = optional(object({
      login_username = string
      object_id      = optional(string)
    }))
    tags = optional(map(string))
  }))
}

variable "sql_database" {
  description = "Configuration for the Azure SQL Database"
  type = map(object({
    name         = string
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name  = string
    enclave_type = string
    server_key = string
  }))
}
variable "server_data"{
  type = map(object({
    server_name = string
     resource_group_name = string
  }))
}

variable "keyvault" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
  }))
}

variable "kvs" {
  type = map(object({
    key_vault_secret_name = string
    vm_secrets          = string
  }))
}