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
| terraform | ~> 0.13 |
| aws | ~> 3.12.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.12.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_availability\_zone | The availability zone of the resource. | `string` | `"eu-west-1a"` | no |
| aws\_region | The region of the aws account | `string` | `"eu-west-1"` | no |
| dagster-container-home | n/a | `string` | `"/opt"` | no |
| dagster\_config\_bucket | Dagster bucket containing the config files. | `string` | `"dagster-bucket"` | no |
| dagster\_file | The config file needed to use database and daemon with dagit. | `string` | `"dagster.yaml"` | no |
| ecs\_cpu | The amount of cpu to give to the ECS instance. | `number` | `1024` | no |
| ecs\_memory | The amount of ecs memory to give to the ECS instance. | `number` | `2048` | no |
| log\_retention | The number of days that the logs shoud live. | `number` | `7` | no |
| private\_subnet | The private subnets where the RDS and ECS reside. | `list(string)` | `[]` | no |
| public\_subnet | The public subnet where the load balancer should reside. Moreover, the ecs and rds will use these if no private subnets are defined. At least two should be provided. | `list(string)` | `[]` | no |
| rds\_deletion\_protection | n/a | `bool` | `false` | no |
| rds\_instance\_class | The type of instance class for the RDS. | `string` | `"db.t2.micro"` | no |
| rds\_password | The password to access the RDS instance. | `string` | `""` | no |
| rds\_username | The username to access the RDS instance. | `string` | `""` | no |
| resource\_prefix | The prefix of the resource to be created | `string` | `"ps"` | no |
| resource\_suffix | The suffix of the resource to be created | `string` | `"sp"` | no |
| tags | Tags to add to the created resources. | `map(string)` | <pre>{<br>  "Name": "Terraform-aws-dagster"<br>}</pre> | no |
| vpc | The id of the virtual private cloud. | `string` | `""` | no |
| workspace\_file | The config file needed to run dagit. | `string` | `"workspace.yaml"` | no |

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