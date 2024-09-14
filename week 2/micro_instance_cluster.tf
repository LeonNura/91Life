

resource "google_container_cluster" "primary" {
  name               = "ninetyone-life-playground"
  location           = "europe-west1-b"
  deletion_protection = false

  node_pool {
    name       = "default-pool"
    node_count = 2

    node_config {
      machine_type = "e2-medium"
      disk_size_gb = 40

      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform",
      ]
    }

    management {
      auto_repair  = true
      auto_upgrade = true
    }
  }
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

terraform {
  backend "gcs" {
    bucket = "ninetyone-life-playground-terraform-state"
    prefix = "terraform/state"
  }
}