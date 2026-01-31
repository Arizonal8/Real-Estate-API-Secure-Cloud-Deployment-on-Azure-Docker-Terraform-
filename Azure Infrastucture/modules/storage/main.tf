variable "project_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }

resource "random_string" "suffix" {
  length  = 4
  upper   = false
  special = false
}

resource "azurerm_storage_account" "storage" {
  name = "${replace(var.project_name, "-", "")}store${random_string.suffix.result}"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    project = var.project_name
    env     = "dev"
  }
}

resource "azurerm_storage_container" "images" {
  name                  = "images"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}

output "name" {
  value = azurerm_storage_account.storage.name
}

output "images_url" {
  value = "https://${azurerm_storage_account.storage.name}.blob.core.windows.net/${azurerm_storage_container.images.name}"
}
