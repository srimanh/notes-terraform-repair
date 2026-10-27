output "network_id" {
  description = "ID of the CloudNotes network"
  value       = module.network.network_id
}

output "service_endpoint" {
  description = "Internal endpoint of the notes API"
  value       = module.service.endpoint
}
