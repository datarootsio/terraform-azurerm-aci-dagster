<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| azurerm | =2.56.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | =2.56.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| charset | Specifies the Charset for the PostgreSQL Database | `string` | `"UTF8"` | no |
| container\_start\_limit | Limit (in seconds) on the start up time of the containers | `number` | `1800` | no |
| dagit\_port\_number | The public port for the running dagit container | `number` | `8080` | no |
| dagster\_container\_home | n/a | `string` | `"/opt"` | no |
| dagster\_file | The dagster instance configuration file | `string` | `"dagster.yaml"` | no |
| db\_collation | Collation type of the SQL database | `string` | `"English_United States.1252"` | no |
| db\_password | The password associated with the server login | `string` | `"Test123456"` | no |
| db\_username | The administrator login name for the SQL server | `string` | `"psuser"` | no |
| location | The location of the resource group that will be created in which all services are created | `string` | `"West Europe"` | no |
| resource\_prefix | Prefix that will be given to every resource name | `string` | `"ps"` | no |
| resource\_suffix | Suffix that will be given to every resource name | `string` | `"sp"` | no |
| server\_port | n/a | `number` | `"5432"` | no |
| server\_version | The version of the created SQL server | `string` | `"11"` | no |
| service\_plan\_size | n/a | `string` | `"S1"` | no |
| service\_plan\_tier | n/a | `string` | `"Standard"` | no |
| sku\_name | Billing information related properties of a server | `string` | `"GP_Gen5_2"` | no |
| storage\_account\_replication | The replication strategy for the created storage account | `string` | `"LRS"` | no |
| storage\_account\_tier | The performance tier for the created storage account | `string` | `"Standard"` | no |
| tags | Custom tag that will be added to every resource for easier management | `map(string)` | <pre>{<br>  "Name": "terraform-azure-dagster"<br>}</pre> | no |
| workspace\_file | The workspace configuration file | `string` | `"workspace.yaml"` | no |

## Outputs

No output.

<!--- END_TF_DOCS --->