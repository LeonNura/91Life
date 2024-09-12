# main.tf for the api module

provider "google" {
  project = var.project_id
  region  = var.region
}

data "google_storage_bucket" "example" {
  name = var.bucket_name_function
}

resource "google_storage_bucket_object" "example2" {
  name   = "api.zip"
  bucket = data.google_storage_bucket.example.name
  source = "${path.module}/api.zip"
}

resource "google_cloudfunctions_function" "example2" {
  name        = var.function_name_api
  runtime     = var.runtime
  trigger_http = true
  source_archive_bucket = data.google_storage_bucket.example.name
  source_archive_object = google_storage_bucket_object.example2.name
  entry_point = var.entry_point_api
}

# provider "google" {
#   project = "ninetyone-life-playground"
#   region  = "europe-west1"
# }

# data "google_storage_bucket" "example" {
#   name = "serverless-bucket-index"
# }

# resource "google_storage_bucket_object" "example2" {
#   name   = "api.zip"
#   bucket = data.google_storage_bucket.example.name
#   source = "./api.zip"
# }

# resource "google_cloudfunctions_function" "example2" {
#   name        = "example-function-api"
#   runtime     = "nodejs20"
#   trigger_http = true
#   source_archive_bucket = data.google_storage_bucket.example.name
#   source_archive_object = google_storage_bucket_object.example2.name
#   entry_point = "api"
# }