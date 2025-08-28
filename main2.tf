resource "azurerm_resource_group" "rg" {
  name = "first-sa-module"
  location = "westeurope"
}

module "template" {
  source  = "app.terraform.io/kris-tf-test/template/azstorage2"
  version = "1.0.0"
  resource_group_name = azurerm_resource_group.rg.name
  environment = var.environment
  storage_account_name = var.storage_account_name
  location = azurerm_resource_group.rg.location
  storage_account_replication_type = var.storage_account_replication_type
}