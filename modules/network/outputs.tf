# modules/network/outputs.tf

output "network_name" {
  value       = google_compute_network.vpc_network.name
  description = "Nombre de la VPC creada"
}

output "network_self_link" {
  value       = google_compute_network.vpc_network.self_link
  description = "URI completa de la VPC (útil para otros recursos)"
}

output "subnet_name" {
  value       = google_compute_subnetwork.subnetwork.name
  description = "Nombre de la subred creada"
}
