# modules/network/main.tf

resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
  description             = "VPC gestionada por Terraform"
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "${var.network_name}-subnet-01"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id

  # Habilitar logs de flujo es buena práctica de seguridad (opcional)
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

# Firewall básico para permitir SSH (ajustar source_ranges en prod)
resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.network_name}-allow-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"] # OJO: En un entorno real, restringe esto a tu VPN/IP
  target_tags   = ["allow-ssh"]
}