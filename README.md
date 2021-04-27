[![Maintained by dataroots](https://img.shields.io/badge/maintained%20by-dataroots-%2300b189)](https://dataroots.io)
[![Terraform 0.13](https://img.shields.io/badge/terraform-0.13-%23623CE4)](https://www.terraform.io)

# Terraform module Dagster on Azure

This is a module for Terraform that deploys Dagster in Azure.

## Setup


- Azure Resource Group
- Azure Storage Account
- Azure File Share containing dagster configuration files
- Azure PostgreSQL server/database
- An Azure App Service:
    -   Dagit UI and Dagster Daemon containers running

Average cost of the minimal setup with Azure database: ~50$/month

## Intend

The Dagster setup provided with this module is intended to be used to manage your runs/schedules/etc... 

## Usage

```hcl
module "dagster" {
    source = "datarootsio/aci-dagster/azure"


    resource_prefix = "my-awesome-company"
    resource_suffix = "env"
    db_password = "super-secret-pass"
}
```

## Adding new pipeline
To add new pipelines to Dagster:
- Add the new pipeline to the 'workspace.yaml' configuration file.
```hcl

load_from:
  - python_file:
      relative_path: new_pipeline.py
      working_directory: /path/to/mounted/volume
```
- Update the created Azure Fileshare by adding the new pipeline and the updated 'workspace.yaml' file. This way Dagit
  and the Dagster Daemon have access to the new pipeline, which will show up in the Dagit UI.

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| azurerm | >=2.56.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >=2.56.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azurerm\_version | The desired azurerm version to create the module with | `string` | `"=2.56.0"` | no |
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

## Makefile Targets

```text
Available targets:

  tools                             Pull Go and Terraform dependencies
  fmt                               Format Go and Terraform code
  lint/lint-tf/lint-go              Lint Go and Terraform code
  test/testverbose                  Run tests

```

## Contributing

Contributions to this repository are very welcome! Found a bug or do you have a suggestion? Please open an issue. Do you know how to fix it? Pull requests are welcome as well! To get you started faster, a Makefile is provided.

Make sure to install [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html), [Go](https://golang.org/doc/install) (for automated testing) and Make (optional, if you want to use the Makefile) on your computer. Install [tflint](https://github.com/terraform-linters/tflint) to be able to run the linting.

* Setup tools & dependencies: `make tools`
* Format your code: `make fmt`
* Linting: `make lint`
* Run tests: `make test` (or `go test -timeout 2h ./...` without Make)

Make sure you branch from the 'open-pr-here' branch, and submit a PR back to the 'open-pr-here' branch.

## License

MIT license. Please see [LICENSE](LICENSE.md) for details.