terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=5.0.0"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
      version = "2.2.0"
    }
  }
}

provider "azurerm" {
  features {}
}
