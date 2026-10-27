output "service_id" {
  description = "ID of the service"
  value       = terraform_data.service.id
}

output "endpoint" {
  description = "Internal endpoint of the service"
  value       = local.endpoint
}
