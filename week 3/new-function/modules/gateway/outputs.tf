# outputs.tf for the gateway module

output "api_gateway_url" {
  value = google_api_gateway_gateway.example.default_hostname
}