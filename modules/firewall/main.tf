resource "google_compute_firewall" "open_all" {
  name    = "allow-all"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["open-to-world"]
}