output "resource_group_name" {
  value = module.rg.name
}

output "static_web_app_url" {
  value = module.static_web_app.url
}

output "backend_api_url" {
  value = module.container_app.url
}

output "cosmosdb_endpoint" {
  value = module.cosmosdb.endpoint
}

output "keyvault_name" {
  value = module.keyvault.name
}

output "keyvault_uri" {
  value = module.keyvault.vault_uri
}
