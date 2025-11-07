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
