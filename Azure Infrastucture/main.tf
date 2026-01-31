module "rg" {
  source       = "./modules/resource_group"
  project_name = var.project_name
  location     = var.location
}

module "log_analytics" {
  source              = "./modules/log_analytics"
  project_name        = var.project_name
  location            = module.rg.location
  resource_group_name = module.rg.name
}

module "storage" {
  source              = "./modules/storage"
  project_name        = var.project_name
  location            = module.rg.location
  resource_group_name = module.rg.name
}

module "cosmosdb" {
  source              = "./modules/cosmosdb"
  project_name        = var.project_name
  location            = module.rg.location
  resource_group_name = module.rg.name
}

module "keyvault" {
  source              = "./modules/keyvault"
  project_name        = var.project_name
  location            = module.rg.location
  resource_group_name = module.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
}

module "container_app" {
  source              = "./modules/container_app"
  project_name        = var.project_name
  location            = module.rg.location
  resource_group_name = module.rg.name
  log_analytics_id    = module.log_analytics.workspace_id
  backend_image       = var.backend_image
  keyvault_id         = module.keyvault.id
  keyvault_uri        = module.keyvault.vault_uri
}

module "static_web_app" {
  source              = "./modules/static_web_app"
  project_name        = var.project_name
  resource_group_name = module.rg.name
  github_repo_url     = var.github_repo_url
  github_branch       = var.github_branch
}
