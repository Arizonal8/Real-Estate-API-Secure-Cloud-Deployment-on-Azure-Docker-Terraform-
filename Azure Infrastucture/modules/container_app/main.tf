variable "project_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "log_analytics_id" { type = string }
variable "backend_image" { type = string }
variable "keyvault_id" { type = string }
variable "keyvault_uri" { type = string }

resource "azurerm_container_app_environment" "env" {
  name                       = "${var.project_name}-cae"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = var.log_analytics_id

  tags = {
    project = var.project_name
    env     = "dev"
  }
}

resource "azurerm_container_app" "api" {
  name                         = "${var.project_name}-api"
  resource_group_name          = var.resource_group_name
  container_app_environment_id = azurerm_container_app_environment.env.id
  revision_mode                = "Single"

  identity {
    type = "SystemAssigned"
  }

  template {
    container {
      name   = "api"
      image  = var.backend_image
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name  = "PORT"
        value = "8080"
      }
    }
  }

  ingress {
    external_enabled = true
    target_port      = 8080
    transport        = "auto"

    traffic_weight {
        latest_revision = true
      percentage = 100
    }
  }

  tags = {
    project = var.project_name
    env     = "dev"
  }
}

output "url" {
  value = azurerm_container_app.api.latest_revision_fqdn
}

output "principal_id" {
  value = azurerm_container_app.api.identity[0].principal_id
}
