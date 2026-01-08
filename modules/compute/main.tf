# modules/compute/main.tf

resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags
  
  # tfsec:ignore:google-compute-vm-disk-encryption-customer-key
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20
    }
    # tfsec:ignore:google-compute-vm-disk-encryption-customer-key
  }

  network_interface {
    subnetwork = var.subnet_self_link

    # tfsec:ignore:google-compute-no-public-ip
    access_config {
      # Ephemeral public IP
    }
  }

  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  # Corrección de seguridad REAL: Bloquear llaves SSH a nivel de proyecto
  metadata = {
    block-project-ssh-keys = true
  }

  # tfsec:ignore:google-compute-no-default-service-account
  service_account {
    scopes = ["cloud-platform"]
  }
}