provider "google" {
  project = "ninetyone-life-playground"
  region  = "europe-west12"
  zone    = "europe-west12-b"
}

resource "google_compute_instance" "default" {
  name         = "life91-vm"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size = 20
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }

  tags = ["http-server", "https-server"]

  scheduling {
    preemptible        = true
    automatic_restart  = false
    on_host_maintenance = "TERMINATE"
  }
}

output "instance_ip" {
  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}

resource "google_compute_firewall" "http" {
  name    = "http-traffic"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags = ["http-server"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "https" {
  name    = "https-traffic"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  target_tags = ["https-server"]
  source_ranges = ["0.0.0.0/0"]
}

# saving the terraform state in google bucket
terraform {
  backend "gcs" {
    bucket = "ninetyone-life-playground-terraform-state"
    prefix = "terraform/state"
  }
}
