variable "project_name" { type = string }
variable "resource_group_name" { type = string }
variable "github_repo_url" { type = string }
variable "github_branch" { type = string }

data "azurerm_client_config" "current" {}

resource "azapi_resource" "swa" {
  type      = "Microsoft.Web/staticSites@2022-09-01"
  name      = "${var.project_name}-swa"
  location  = "westeurope"
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.resource_group_name}"

  body = {
    sku = {
      name = "Free"
      tier = "Free"
    }

    properties = {
      repositoryUrl = var.github_repo_url
      branch        = var.github_branch
      buildProperties = {
        appLocation = "/client"
      }
    }
  }

  # THIS IS REQUIRED — tells Azure which fields to return
  response_export_values = ["properties.defaultHostname"]
}

output "url" {
  value = "https://${azapi_resource.swa.output.properties.defaultHostname}"
}
