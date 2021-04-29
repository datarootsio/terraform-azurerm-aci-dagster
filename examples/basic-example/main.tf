terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.56.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "azure-dagster" {
  source          = "../.."
  resource_prefix = "dev"
  resource_suffix = "12345"
  db_username = "databaseuser"
  db_password = "SecretPassword123"
}

## Output the url of the running azure app service, this url can be used to access the dagit web server.
output "azure_url" {
  value = module.azure-dagster.dagster_appservice_url
}