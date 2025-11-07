terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
}

provider "azurerm" {
 features {}
 subscription_id = "06f4c176-e41e-424a-bfc2-cb4b3a4e5fe5"
}