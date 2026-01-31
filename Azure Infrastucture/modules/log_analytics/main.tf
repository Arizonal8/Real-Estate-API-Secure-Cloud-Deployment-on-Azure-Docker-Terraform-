variable "project_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }

resource "azurerm_log_analytics_workspace" "law" {
  name                = "${var.project_name}-law"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = {
    project = var.project_name
    env     = "dev"
  }
}

output "workspace_id" {
  value = azurerm_log_analytics_workspace.law.id
}
