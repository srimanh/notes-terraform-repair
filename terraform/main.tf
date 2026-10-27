# CloudNotes root configuration.
# Uses the built-in terraform_data resource, so no cloud provider,
# account, or credential is needed. Run init, validate, and plan only.

module "network" {
  source       = "./modules/network"
  network_name = "notes-${var.environment}-vpc"
  region       = var.region
}

module "service" {
  source       = "./modules/service"
  service_name = "notes-api"
  environment  = var.environment
  region       = var.region
  app_port     = var.app_port
  network_id   = module.network.network_id
}
