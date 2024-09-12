# main.tf for the hello module

provider "google" {
  project = var.project_id
  region  = var.region
}

data "google_storage_bucket" "example" {
  name = var.bucket_name
}

resource "google_storage_bucket_object" "example" {
  name   = var.object_name_hello
  bucket = data.google_storage_bucket.example.name
  source = "${path.module}/helloWorld.zip"
}

resource "google_cloudfunctions_function" "example" {
  name        = var.function_name_hello
  runtime     = var.runtime
  trigger_http = true
  source_archive_bucket = data.google_storage_bucket.example.name
  source_archive_object = google_storage_bucket_object.example.name
  entry_point = var.entry_point_hello
}