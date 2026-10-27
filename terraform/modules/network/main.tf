resource "terraform_data" "network" {
  input = {
    name   = var.network_name
    region = var.region
  }
}
