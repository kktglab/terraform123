# # TERRAFORM CONFIGURATION BLOK
# terraform {
#   required_version = ">= 1.13"
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~>4.41.0"
#     }
#   }
#   cloud {
#     organization = "kris-tf-test"
#     workspaces {
#       name = "terraform123"
#     }
#   }
# }

# provider "azurerm" {
#   features {}
# }

# locals {
#   workload_name = "modeldata"
#   environment = "prod"
#   instance = "001"
#   tags = {
#     "Environment" = var.environment
#     "CreatedBy" = "Krzychu"
#     }
# }

# data "azurerm_resource_group" "milestonerg" {
#   name     = "rg-milestone-dev-01"
# }

# resource "azurerm_resource_group" "testrg01" {
#   name     = "rg-${local.workload_name}-${local.environment}-${local.instance}"
#   location = "westeurope"
# }

# resource "azurerm_storage_account" "samilestone" {
#   name                     = "sa${local.workload_name}${local.environment}${local.instance}"
#   resource_group_name      = azurerm_resource_group.testrg01.name
#   location                 = azurerm_resource_group.testrg01.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"
#   tags = {
#     environment = "dev"
#     createdBy   = "Krzychu"
#   }
# }

# resource "azurerm_storage_account" "samilestone2" {
#   name                     = lower("${var.storage_account_name}stone01")
#   resource_group_name      = data.azurerm_resource_group.milestonerg.name
#   location                 = data.azurerm_resource_group.milestonerg.location
#   account_tier             = "Standard"
#   account_replication_type = var.storage_account_replication_type
#   tags = local.tags
# }

# resource "azurerm_storage_account" "samilestone3" {
#   name                     = lower("${var.storage_account_name}abc01")
#   resource_group_name      = data.azurerm_resource_group.milestonerg.name
#   location                 = data.azurerm_resource_group.milestonerg.location
#   account_tier             = "Standard"
#   account_replication_type = var.environment == "stg" ? "LRS" : var.storage_account_replication_type
#   tags = local.tags
# }

# resource "azurerm_storage_account" "samilestone4" {
#   name                     = lower("${var.storage_account_name}abc02")
#   resource_group_name      = data.azurerm_resource_group.milestonerg.name
#   location                 = data.azurerm_resource_group.milestonerg.location
#   account_tier             = "Standard"
#   account_replication_type = var.environment == "stg" ? "LRS" : var.storage_account_replication_type
#   tags = local.tags
# }