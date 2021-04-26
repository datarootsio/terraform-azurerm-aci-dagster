resource "azurerm_resource_group" "dagster_rg" {
  location = var.location
  name     = "${var.resource_prefix}-rg-dagster-${var.resource_suffix}"
  tags     = var.tags
}

resource "azurerm_storage_account" "storage_dagster" {
  account_replication_type = var.storage_account_replication
  account_tier             = var.storage_account_tier
  location                 = var.location
  name                     = "${var.resource_prefix}storagedagster${var.resource_suffix}"
  resource_group_name      = azurerm_resource_group.dagster_rg.name
  tags                     = var.tags
}

resource "azurerm_storage_share" "dagster-fileshare" {
  name                 = "${var.resource_prefix}-fileshare-dagster-${var.resource_suffix}"
  storage_account_name = azurerm_storage_account.storage_dagster.name
}

resource "azurerm_storage_share_file" "workspace_file" {
  name             = "workspace.yaml"
  storage_share_id = azurerm_storage_share.dagster-fileshare.id
  source           = "files/workspace.yaml"
}

resource "azurerm_storage_share_file" "dagster_file" {
  name             = "dagster.yaml"
  storage_share_id = azurerm_storage_share.dagster-fileshare.id
  source           = "files/dagster.yaml"
}

resource "azurerm_storage_share_file" "dummy_pipeline" {
  name             = "dummy_pipeline.py"
  storage_share_id = azurerm_storage_share.dagster-fileshare.id
  source           = "files/dummy_pipeline.py"
}