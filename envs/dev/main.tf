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

# envs/dev/main.tf (Agrega esto al final)

module "vm_compute" {
  source = "../../modules/compute"

  # Nombres y configuración básica
  instance_name = "vm-dev-01"
  zone          = "${var.region}-a"

  # CONEXIÓN CLAVE: Aquí tomamos el output del módulo de red y se lo pasamos a la VM.
  # Esto crea una dependencia implícita: Terraform sabe que primero debe crear la red.
  subnet_self_link = module.vpc_network.subnet_name
}
