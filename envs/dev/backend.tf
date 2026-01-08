# envs/dev/backend.tf

terraform {
  # backend "gcs" {
  #   bucket  = ""
  #   prefix  = "terraform/state"
  # }
  
  # Para este ejemplo de portafolio usamos local, pero en prod usaríamos GCS arriba ⬆
  backend "local" {}
}