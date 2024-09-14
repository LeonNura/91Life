# provider "google" {
#   project = ""
#   region  = "europe-west1"
# }

# provider "google-beta" {
#   project = ""
#   region  = "europe-west1"
# }

# resource "google_api_gateway_api" "example" {
#   provider = google-beta
#   api_id = "example-api-id"
# }

# resource "local_file" "spec" {
#   filename = "${path.module}/spec.yaml"
#   content  = templatefile("${path.module}/spec.yaml.tpl", {
#     hello_address = data.terraform_remote_state.hello.outputs.hello_address
#     api_address   = data.terraform_remote_state.api.outputs.api_address
#   })
# }

# resource "google_api_gateway_api_config" "example" {
#   provider = google-beta
#   api         = google_api_gateway_api.example.api_id
#   openapi_documents {
#     document {
#       path = "spec.yaml"
#       contents = base64encode(local_file.spec.content)
#     }
#   }
# }

# resource "google_api_gateway_gateway" "example" {
#   provider = google-beta
#   gateway_id = google_api_gateway_api.example.api_id
#   api_config = google_api_gateway_api_config.example.id
# }

# main.tf for the gateway module

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

resource "google_api_gateway_api" "example" {
  provider = google-beta
  api_id   = var.api_id
}

resource "local_file" "spec" {
  filename = var.spec_output_path
  content  = templatefile("${path.module}/spec.yaml.tpl", {
    hello_address = var.hello_address
    api_address   = var.api_address
  })
}

resource "google_api_gateway_api_config" "example" {
  provider = google-beta
  api       = google_api_gateway_api.example.api_id
  openapi_documents {
    document {
      path     = var.spec_output_path
      contents = base64encode(local_file.spec.content)
    }
  }
}

resource "google_api_gateway_gateway" "example" {
  provider     = google-beta
  gateway_id   = var.gateway_id
  api_config   = google_api_gateway_api_config.example.id
}