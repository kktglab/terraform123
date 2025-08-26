# TERRAFORM CONFIGURATION BLOK
terraform {
  required_version = ">= 1.10"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.41.0"
    }
  }
  cloud {
    organization = "kris-tf-test"
    workspaces {
      name = "terraform123"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "761d54cc-a644-4036-a5d4-7db14f4e62d6"
}

resource "azurerm_resource_group" "milestonerg" {
  name     = "rg-milestone-dev-01"
  location = "westeurope"
}

resource "azurerm_storage_account" "samilestone" {
  name                     = "samilestone001"
  resource_group_name      = azurerm_resource_group.milestonerg.name
  location                 = azurerm_resource_group.milestonerg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = "dev"
    createdBy   = "Krzychu"
  }
}