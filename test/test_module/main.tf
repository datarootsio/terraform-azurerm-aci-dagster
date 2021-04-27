provider "azurerm" {
  features {}
}

module "aci-dagster" {
  source          = "../.."
  resource_prefix = var.resource_prefix
  resource_suffix = var.resource_suffix
}