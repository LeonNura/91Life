# outputs.tf the api address

output "api_address" {
  value = google_cloudfunctions_function.example2.https_trigger_url
}