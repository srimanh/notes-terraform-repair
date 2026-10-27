variable "service_name" {
  type        = string
  description = "Name of the service"
}

variable "environment" {
  type        = string
  description = "Deployment environment name"
}

variable "region" {
  type        = string
  description = "Region where the service runs"
}

variable "app_port" {
  type        = number
  description = "Port the application listens on"
}

variable "network_id" {
  type        = string
  description = "ID of the network the service attaches to"
}
