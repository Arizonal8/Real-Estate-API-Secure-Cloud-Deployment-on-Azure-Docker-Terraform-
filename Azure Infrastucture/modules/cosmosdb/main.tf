variable "project_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }

resource "azurerm_cosmosdb_account" "cosmos" {
  name                = "${var.project_name}-cosmos"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "MongoDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  tags = {
    project = var.project_name
    env     = "dev"
  }
}

resource "azurerm_cosmosdb_mongo_database" "db" {
  name                = "realestate"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos.name
}

output "endpoint" {
  value = azurerm_cosmosdb_account.cosmos.endpoint
}

output "primary_key" {
  value = azurerm_cosmosdb_account.cosmos.primary_key
}
