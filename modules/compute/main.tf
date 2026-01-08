resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20
    }
  }

  network_interface {
    # Aquí conectamos la VM a la red que crea el otro módulo
    subnetwork = var.subnet_self_link

    # Si quieres IP pública, deja este bloque access_config vacío.
    # Para mayor seguridad (DevSecOps), en prod lo quitaríamos para usar solo IP privada.
    access_config {
      # Ephemeral public IP
    }
  }

  # Configuración de Seguridad (Hardening básico)
  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  service_account {
    # Usar la cuenta por defecto no es best practice, pero sirve para el demo.
    # Lo ideal sería pasar una SA creada específicamente.
    scopes = ["cloud-platform"]
  }
}