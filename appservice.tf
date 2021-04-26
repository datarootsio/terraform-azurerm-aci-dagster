resource "azurerm_app_service_plan" "dagster_service_plan" {
  location            = var.location
  name                = "${var.resource_prefix}-dagster-service-${var.resource_suffix}"
  resource_group_name = azurerm_resource_group.dagster_rg.name
  kind                = "Linux"
  reserved            = true
  sku {
    size = var.service_plan_size
    tier = var.service_plan_tier
  }
  tags = var.tags
}

resource "azurerm_app_service" "dagster" {
  app_service_plan_id = azurerm_app_service_plan.dagster_service_plan.id
  location            = var.location
  name                = "${var.resource_prefix}-dagster-app-service-${var.resource_suffix}"
  resource_group_name = azurerm_resource_group.dagster_rg.name
  site_config {
    linux_fx_version = "COMPOSE|${filebase64("docker-compose.yml")}"
    always_on        = true
  }
  storage_account {
    access_key   = azurerm_storage_account.storage_dagster.primary_access_key
    account_name = azurerm_storage_account.storage_dagster.name
    name         = "mount"
    share_name   = azurerm_storage_share.dagster-fileshare.name
    type         = "AzureFiles"
  }
  app_settings = {
    DAGSTER_HOME                        = "${var.dagster_container_home}"
    PG_DB_CONN_STRING                   = "postgresql://${var.db_username}@${azurerm_postgresql_server.dagster-postgresql.name}:${var.db_password}@${azurerm_postgresql_server.dagster-postgresql.fqdn}:${var.server_port}/${azurerm_postgresql_database.dagster-database.name}"
    WEBSITES_WEB_CONTAINER_NAME         = "dagit-container"
    WEBSITES_CONTAINER_START_TIME_LIMIT = var.container_start_limit
  }
  tags = var.tags
}