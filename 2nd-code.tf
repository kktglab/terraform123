# TERRAFORM CONFIGURATION BLOK
terraform {
  required_version = ">= 1.13"
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
}

variable "storage_account_replication_type" {
  type = string
  default = "LRS"  
}
variable "storage_account_name" {
  type = string
  default = "sakris"
}


data "azurerm_resource_group" "milestonerg" {
  name     = "rg-milestone-dev-01"
}

resource "azurerm_resource_group" "testrg01" {
  name     = "rg-milestone-dev-02"
  location = "westeurope"
}

resource "azurerm_storage_account" "samilestone" {
  name                     = "samilestone001"
  resource_group_name      = data.azurerm_resource_group.milestonerg.name
  location                 = data.azurerm_resource_group.milestonerg.location
  account_tier             = "Standard"
  account_replication_type = var.storage_account_replication_type
  tags = {
    environment = "dev"
    createdBy   = "Krzychu"
  }
}

resource "azurerm_storage_account" "samilestone2" {
  name                     = lower("${var.storage_account_name}stone01")
  resource_group_name      = data.azurerm_resource_group.milestonerg.name
  location                 = data.azurerm_resource_group.milestonerg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = "stg"
    createdBy   = "Krzychu"
  }
}

resource "azurerm_storage_account" "samilestone3" {
  name                     = lower("${var.storage_account_name}abc01")
  resource_group_name      = data.azurerm_resource_group.milestonerg.name
  location                 = data.azurerm_resource_group.milestonerg.location
  account_tier             = "Standard"
  account_replication_type = var.storage_account_replication_type
  tags = {
    environment = "stg"
    createdBy   = "Krzychu"
  }
}