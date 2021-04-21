locals {
  dagster_variables = {
    DAGSTER_HOME : "${var.dagster_container_home}"
    PG_DB_CONN_STRING : "postgresql://${var.db_username}@${azurerm_postgresql_server.dagster-postgresql.name}:${var.db_password}@${azurerm_postgresql_server.dagster-postgresql.fqdn}:${var.server_port}/${azurerm_postgresql_database.dagster-database.name}",
  }
}
