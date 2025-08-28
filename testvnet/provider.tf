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
