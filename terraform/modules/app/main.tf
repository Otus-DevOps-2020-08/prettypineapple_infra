resource "google_compute_instance" "app" {
  name = "reddit-app"
  machine_type = "g1-small"
  zone = var.instance_zone
  tags = ["reddit-app"]
  boot_disk {
    initialize_params {
        image = var.app_disk_image
        }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.app_ip.address
    }
  }
  metadata = {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
}

resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

resource "google_compute_firewall" "firewall_puma_nginx" {
  name = "allow-puma-nginx"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["reddit-app"]
}
