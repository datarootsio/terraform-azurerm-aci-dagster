resource "azurerm_log_analytics_workspace" "dagster-logs" {
  location            = var.location
  name                = "dagster-logs"
  resource_group_name = azurerm_resource_group.dagster_rg.name
}