rgs = {
  rg1 = {
    name     = "rg-jio-pay-app-prod"
    location = "westus"
    # managed_by = "prod_team"
    # tags = {
    #   owner = "akshay"
    #   cost  = "$54"
    #   env   = "dev"
    # }
  }

  rg2 = {
    name     = "rg-jio-pay-app-dev"
    location = "westus2"
  }
}


mystorage = {

  stg1 = {
    name                     = "jiopayappstgkk"
    location                 = "west us"
    resource_group_name      = "rg-jio-pay-app-prod"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    network_rule = {
      default_action = "Deny"
      bypass         = ["AzureServices"]
      ip_rules       = ["122.181.100.122"]
    }
  }

  stg2 = {
    name                     = "jiopaystgprodbb3"
    location                 = "west us"
    resource_group_name      = "rg-jio-pay-app-prod"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    # network_rule = {
    #   default_action = "Deny"
    #   bypass         = ["AzureServices"]
    #   ip_rules       = ["122.181.100.122"]
    # }
  }
}

networks = {
  v1 = {
    name                = "prod-vnet"
    location            = "westus"
    resource_group_name = "rg-jio-pay-app-prod"
    address_space       = ["10.0.0.0/16"]
    subnet = {
      s1 = {
        name             = "prod-subnet1"
        address_prefixes = ["10.0.1.0/24"]
      }
      s2 = {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}
# v2 = {
#   name                = "prod-vnet323"
#   location            = "westus"
#   resource_group_name = "tondurg"
#   address_space       = ["10.0.1.0/16"]
#   subnet = [
#     {
#       name             = "prod-subnet11"
#       address_prefixes = ["10.0.1.0/24"]
#     },
#     {
#       name             = "prod-subnet22"
#       address_prefixes = ["10.0.2.0/24"]
#     }
#   ]
# }

public_ip = {

  pip1 = {
    name                = "jio-pay-app-pip"
    resource_group_name = "rg-jio-pay-app-prod"
    location            = "west us"
    allocation_method   = "Static"
  }

  pip2 = {
    name                = "jio-pay-app-pip-prod"
    resource_group_name = "rg-jio-pay-app-prod"
    location            = "west us"
    allocation_method   = "Static"
  }
}
vms = {
  vm1 = {
    subnet_name         = "prod-subnet1"
    vnet_name           = "prod-vnet"
    resource_group_name = "rg-jio-pay-app-prod"
    ip_name             = "jio-pay-app-pip"
    nic_name            = "jio-pay-app-nic-prod01"
    location            = "westus"
    vm_name             = "jio-app-prod-vm023"
    size                = "Standard_F2"
    # keyvault_name = "jio-prod-kv"
    # kvsecret_name = "app-secret-1"
    # admin_username      = "Akshay"
    # admin_password      = "Password@123456"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}

nsg = {
  nsg1 = {
    name                = "nsg-prod5436"
    location            = "west us"
    resource_group_name = "rg-jio-pay-app-prod"
    security_rule = {
      rule1 = {
        name                       = "vmsecurity453"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

bastion_host = {
  bastion1 = {
    name                = "bastion5461"
    location            = "west us"
    resource_group_name = "rg-jio-pay-app-prod"
    subnet_key          = "s2"
    public_key          = "public_ip2"
  }
}


sql_servers = {
  server1 = {
    name                         = "hhhfddss"
    resource_group_name          = "rg-jio-pay-app-prod"
    location                     = "westus2"
    version                      = "12.0"
    administrator_login          = "sqladminuser"
    administrator_login_password = "P@ssw0rd1234!"
    minimum_tls_version          = "1.2"
    azuread_administrator = {
      login_username = "aadadminuser"
    }
  }
}



sql_database = {
  "db1" = {
    name         = "sqldb-dev-01"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
    server_key   = "ser1"
  }
}

server_data = {
  ser1 = {
    server_name         = "sqltech-eastus2"
    resource_group_name = "rg-dev"
  }
}

keyvault = {
  kv1 = {
    name                        = "jio-prod-kvs1"
    location                    = "west us"
    resource_group_name         = "rg-jio-pay-app-prod"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
  }
}

kvs = {
  kv1 = {
    key_vault_secret_name =  "secret-username" 
    vm_secrets            = "Akshay"
  }
  kv2 = {
        key_vault_secret_name =  "secret-password" 
    vm_secrets            = "Cloud$Admin123"

  }
}