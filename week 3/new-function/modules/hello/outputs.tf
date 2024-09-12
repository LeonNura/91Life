# outputs.tf for the hello module

output "hello_address" {
  value = google_cloudfunctions_function.example.https_trigger_url
}