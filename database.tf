resource "azurerm_postgresql_server" "dagster-postgresql" {
  location                      = var.location
  name                          = "dagster-sqlserver"
  resource_group_name           = azurerm_resource_group.dagster_rg.name
  version                       = var.server_version
  sku_name                      = var.sku_name
  administrator_login           = var.db_username
  administrator_login_password  = var.db_password
  public_network_access_enabled = true
  tags                          = var.tags
  ssl_enforcement_enabled       = false
}

resource "azurerm_postgresql_firewall_rule" "dagster-firewall" {
  end_ip_address      = "0.0.0.0"
  name                = "dagster-firewall"
  resource_group_name = azurerm_resource_group.dagster_rg.name
  server_name         = azurerm_postgresql_server.dagster-postgresql.name
  start_ip_address    = "0.0.0.0"
}

resource "azurerm_postgresql_database" "dagster-database" {
  charset             = var.charset
  collation           = var.db_collation
  name                = "dagster-database"
  resource_group_name = azurerm_resource_group.dagster_rg.name
  server_name         = azurerm_postgresql_server.dagster-postgresql.name
}