resource "azurerm_container_app" "backend" {
  name                         = "${var.project_name}-backend"
  resource_group_name          = module.rg.name
  container_app_environment_id = azurerm_container_app_environment.env.id
  revision_mode                = "Single"

  identity {
    type = "SystemAssigned"
  }

  template {
    container {
      name   = "backend"
      image  = var.backend_image
      cpu    = 0.5
      memory = "1Gi"

      env {
        name        = "COSMOS_DB_URI"
        secret_name = "cosmos-db-uri"
      }

      env {
        name        = "COSMOS_DB_KEY"
        secret_name = "cosmos-db-key"
      }
    }
  }

  secret {
    name  = "cosmos-db-uri"
    value = var.cosmos_db_uri
  }

  secret {
    name  = "cosmos-db-key"
    value = var.cosmos_db_key
  }

  ingress {
    external_enabled = true
    target_port      = 4000

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}
