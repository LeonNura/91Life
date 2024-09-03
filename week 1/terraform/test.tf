# Configure the Google Cloud provider
provider "google" {
  project = "ninetyone-life-playground"
  region  = "europe-west12"
  zone    = "europe-west12-b"
}

# Create a Google Cloud Storage bucket
resource "google_storage_bucket" "terraform-state" {
  name          = "ninetyone-life-playground-terraform-state"
  location      = "EU"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}

# Define the VM instance
resource "google_compute_instance" "default" {
  name         = "91Life-vm"
  machine_type = "e2-medium"
  preemptible  = true

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
}

output "instance_ip" {
  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}

# Create a firewall rule to allow HTTP traffic
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

# Create a firewall rule to allow HTTPS traffic (optional)
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

# Save the Terraform state in the Google Cloud Storage bucket
terraform {
  backend "gcs" {
    bucket = google_storage_bucket.terraform-state.name
    prefix = "terraform/state"
  }
}