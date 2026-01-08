# envs/dev/variables.tf

variable "project_id" {
  description = "ID del proyecto GCP donde se desplegará dev"
  type        = string
  # No ponemos default por seguridad, para obligar a definirlo en un .tfvars o variable de entorno
}

variable "region" {
  description = "Región por defecto"
  type        = string
  default     = "us-central1"
}