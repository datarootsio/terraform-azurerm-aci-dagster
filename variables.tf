## General variables

variable "resource_prefix" {
  type = string
  default = "ps"
  description = "Prefix that will be given to every resource name"
}

variable "resource_suffix" {
  type = string
  default = "sp"
  description = "Suffix that will be given to every resource name"
}

variable "tags" {
  type        = map(string)
  default     = { Name = "terraform-azure-dagster" }
  description = "Custom tag that will be added to every resource for easier management"
}

variable "location" {
  type        = string
  default     = "West Europe"
  description = "The location of the resource group that will be created in which all services are created"
}

## Fileshare variables

variable "storage_account_tier" {
  type = string
  default = "Standard"
  description = "The performance tier for the created storage account"
}

variable "storage_account_replication" {
  type = string
  default = "LRS"
  description = "The replication strategy for the created storage account"
}

## Database variables

variable "server_version" {
  type        = string
  default     = "11"
  description = "The version of the created SQL server"
}

variable "db_username" {
  type        = string
  default     = "psuser"
  description = "The administrator login name for the SQL server"
}

variable "db_password" {
  type        = string
  default     = "Test123456"
  description = "The password associated with the server login"
}

variable "sku_name" {
  type        = string
  default     = "GP_Gen5_2"
  description = "Billing information related properties of a server"
}

variable "charset" {
  type        = string
  default     = "UTF8"
  description = "Specifies the Charset for the PostgreSQL Database"
}

variable "db_collation" {
  type        = string
  default     = "English_United States.1252"
  description = "Collation type of the SQL database"
}

## App-service variables

variable "service_plan_size" {
  type    = string
  default = "S1"
}
variable "service_plan_tier" {
  type    = string
  default = "Standard"
}

variable "container_start_limit" {
  type = number
  default = 1800
  description = "Limit (in seconds) on the start up time of the containers"
}

## Configuration file names

variable "workspace_file" {
  type        = string
  default     = "workspace.yaml"
  description = "The workspace configuration file"
}

variable "dagster_file" {
  type        = string
  default     = "dagster.yaml"
  description = "The dagster instance configuration file"
}

variable "dagster_container_home" {
  type    = string
  default = "/opt"
}

variable "dagit_port_number" {
  type        = number
  default     = 8080
  description = "The public port for the running dagit container"
}

variable "server_port" {
  type    = number
  default = "5432"
}