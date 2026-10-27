resource "terraform_data" "service" {
  input = {
    name        = var.service_name
    environment = var.environment
    region      = var.region
    port        = var.app_port
    network_id  = var.network_id
  }
}

locals {
  endpoint = "http://${var.service_name}.${var.region}.internal:${var.app_port}"
}
