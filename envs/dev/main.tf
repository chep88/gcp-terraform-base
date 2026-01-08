# envs/dev/main.tf

provider "google" {
  project = var.project_id
  region  = var.region
}

# Llamada al Módulo de Red
module "vpc_network" {
  # Aquí está la magia: reutilizamos el código de la carpeta modules
  source = "../../modules/network"

  # Pasamos los valores específicos para este entorno (DEV)
  project_id   = var.project_id
  region       = var.region
  network_name = "vpc-dev-main"
  subnet_cidr  = "10.10.0.0/24"
}