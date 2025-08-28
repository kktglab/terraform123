terraform {
  required_version = ">= 1.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.41.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id                 = "761d54cc-a644-4036-a5d4-7db14f4e62d6"
  environment                     = "public"
  use_msi                         = false
  use_cli                         = true
  use_oidc                        = false
  resource_provider_registrations = "none"
}
