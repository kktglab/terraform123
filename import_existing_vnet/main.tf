variable "azurerm_resource_group"{
  description = "Resource Group to use"
  type = string
}

data "azurerm_resource_group" "rg" {
  name = var.azurerm_resource_group  
}

resource "azurerm_virtual_network" "res-19" {
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.rg.location
  name                = "master-vnet"
  resource_group_name = data.azurerm_resource_group.rg.name
}
resource "azurerm_subnet" "res-20" {
  address_prefixes     = ["10.0.0.0/24"]
  name                 = "default"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.res-19.name
}
resource "azurerm_virtual_network" "res-21" {
  address_space       = ["10.0.0.0/16"]
  location            = "northeurope"
  name                = "worker-vnet"
  resource_group_name = data.azurerm_resource_group.rg.name
}
resource "azurerm_subnet" "res-22" {
  address_prefixes     = ["10.0.0.0/24"]
  name                 = "default"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.res-21.name
}
