resource "azurerm_resource_group" "rg" {
  name = "first-sa-module"
  location = "westeurope"
}

module "template" {
  source  = "app.terraform.io/kris-tf-test/template/azstorage2"
  version = "1.0.0"
  resource_group_name = azurerm_resource_group.rg.name
  environment = "prod"
  storage_account_name = "sakristerr"
  location = azurerm_resource_group.rg.location
  storage_account_replication_type = "LRS"
}