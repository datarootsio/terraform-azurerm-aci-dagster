resource "azurerm_resource_group" "dagster_rg" {
  location = var.location
  name     = "rg-dagster"
}

resource "azurerm_storage_account" "storage_dagster" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = var.location
  name                     = "storagedagster"
  resource_group_name      = azurerm_resource_group.dagster_rg.name
}

resource "azurerm_storage_share" "dagster-fileshare" {
  name                 = "fileshare-dagster"
  storage_account_name = azurerm_storage_account.storage_dagster.name

}

//
//resource "azurerm_storage_blob" "workspace" {
//  name                   = var.workspace_file
//  storage_account_name   = azurerm_storage_account.storage_dagster.name
//  storage_container_name = azurerm_storage_share.dagster-fileshare.name
//  type                   = "Block"
//  source                 = "files/${var.workspace_file}"
//}
//
//resource "azurerm_storage_blob" "instance" {
//  name                   = var.dagster_file
//  storage_account_name   = azurerm_storage_account.storage_dagster.name
//  storage_container_name = azurerm_storage_share.dagster-fileshare.name
//  type                   = "Block"
//  source                 = "files/${var.dagster_file}"
//}
//
//resource "azurerm_storage_blob" "repo" {
//  for_each               = fileset("files/tests/simple_dagster/", "*")
//  name                   = each.value
//  storage_account_name   = azurerm_storage_account.storage_dagster.name
//  storage_container_name = azurerm_storage_share.dagster-fileshare.name
//  type                   = "Block"
//  source                 = "files/tests/simple_dagster/${each.value}"
//}