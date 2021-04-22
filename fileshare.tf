resource "azurerm_resource_group" "dagster_rg" {
  location = var.location
  name     = "rg-dagster"
  tags = var.tags
}

resource "azurerm_storage_account" "storage_dagster" {
  account_replication_type = var.storage_account_replication
  account_tier             = var.storage_account_tier
  location                 = var.location
  name                     = "storagedagster"
  resource_group_name      = azurerm_resource_group.dagster_rg.name
  tags = var.tags
}

resource "azurerm_storage_share" "dagster-fileshare" {
  name                 = "fileshare-dagster"
  storage_account_name = azurerm_storage_account.storage_dagster.name
}