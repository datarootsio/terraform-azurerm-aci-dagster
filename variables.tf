variable "location" {
  type        = string
  default     = "West Europe"
  description = "The location of the resource group that will be created in which all services are created"
}

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

variable "cpu" {
  type        = string
  default     = "2"
  description = "The required number of CPU cores of the containers"
}

variable "memory" {
  type        = string
  default     = "2"
  description = "The required memory of the containers in GB"
}

##postgress database

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

## app service variables

variable "service_plan_size" {
  type    = string
  default = "S1"
}
variable "service_plan_tier" {
  type    = string
  default = "Standard"
}

## tags

variable "tags" {
  type        = map(string)
  default     = { Name = "terraform-azure-dagster" }
  description = "Tags to add to the created resources."
}

variable "server_port" {
  type    = number
  default = "5432"
}