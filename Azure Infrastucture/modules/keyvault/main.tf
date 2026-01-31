variable "project_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "tenant_id" { type = string }

resource "random_string" "suffix" {
  length  = 4
  upper   = false
  special = false
}

resource "azurerm_key_vault" "kv" {
  name = "${var.project_name}-kv-${random_string.suffix.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = "standard"

  tags = {
    project = var.project_name
    env     = "dev"
  }
}

output "id" {
  value = azurerm_key_vault.kv.id
}

output "name" {
  value = azurerm_key_vault.kv.name
}

output "vault_uri" {
  value = azurerm_key_vault.kv.vault_uri
}
