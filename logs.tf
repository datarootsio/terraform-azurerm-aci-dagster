resource "azurerm_log_analytics_workspace" "dagster-logs" {
  location            = var.location
  name                = "${var.resource_prefix}-logs-dagster-${var.resource_suffix}"
  resource_group_name = azurerm_resource_group.dagster_rg.name
}