resource "google_compute_instance" "public_vm" {
  name         = "public-vm"
  machine_type = "e2-micro"
  zone         = "europe-west3-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
      # This gives the VM a public IP
    }
  }

  # Intentionally missing labels/tags
}