variable "environment" {
  type        = string
  description = "Deployment environment name"
  default     = "local"
}

variable "region" {
  type        = string
  description = "Region for CloudNotes resources"
  default     = "us-central1"
}

variable "app_port" {
  type        = number
  description = "Port the notes API listens on"
  default     = 5000
}
