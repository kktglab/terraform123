# # TERRAFORM CONFIGURATION BLOK
# terraform {
#   required_version = "~> 1.10.4" # REQUIRED TERRAFORM VERSION
#   cloud {
#     organization = "Fujitsu"
#     workspaces {                    # BACKEND OR CLOUD CONFIGURATION
#       name = "milstone"
#     }
#   }

# # REQUIRED PROVIDERS
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = "~>4.41.0"
#       }
#   }
# }

# # PROVIDER CONFIGURATION BLOK
# provider "azurerm" {
#   features {}
#   skip_provider_registration = true
# }


# resource "azurerm_resource_group" "milestonerg" {
#   name = "rg-milestone-dev-01"
#   location = "west-europe"
# }