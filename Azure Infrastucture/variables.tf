variable "project_name" {
  type        = string
  description = "Short name used as prefix for resources"
}

variable "location" {
  type        = string
  default     = "westeurope"
}

variable "github_repo_url" {
  type        = string
  description = "Your forked GitHub repo URL"
}

variable "github_branch" {
  type        = string
  default     = "main"
}

variable "backend_image" {
  type        = string
  description = "Docker image for backend API"
}

variable "cosmos_db_uri" {
  type        = string
  description = "The URI for the Cosmos DB"
}

variable "cosmos_db_key" {
  type        = string
  description = "The key for the Cosmos DB"
}
