resource "azurerm_container_app_environment" "env" {
  name                = "${var.project_name}-cae"
  location            = module.rg.location
  resource_group_name = module.rg.name

  tags = {
    project = var.project_name
    env     = "dev"
  }
}
