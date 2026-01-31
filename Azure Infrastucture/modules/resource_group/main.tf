variable "project_name" {
  type = string
}

variable "location" {
  type = string
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.project_name}-rg"
  location = var.location

  tags = {
    project = var.project_name
    env     = "dev"
  }
}

output "name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}

output "id" {
  value = azurerm_resource_group.rg.id
}
