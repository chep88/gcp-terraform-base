output "instance_ip" {
  value       = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
  description = "IP Pública de la instancia"
}

output "instance_internal_ip" {
  value = google_compute_instance.vm_instance.network_interface[0].network_ip
}