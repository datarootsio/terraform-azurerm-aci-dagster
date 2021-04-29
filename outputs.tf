output "dagster_appservice_url" {
  description = "The url of the running app service. This url can be used to access the Dagit webserver"
  value       = azurerm_app_service.dagster.default_site_hostname
}