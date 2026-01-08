# modules/network/variables.tf

variable "project_id" {
  description = "ID del proyecto de GCP"
  type        = string
}

variable "region" {
  description = "Región donde se desplegará la subred"
  type        = string
}

variable "network_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "Rango CIDR para la subred"
  type        = string
  default     = "10.0.1.0/24"
}
