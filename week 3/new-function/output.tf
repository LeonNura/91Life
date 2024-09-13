# output.tf root module

output "api_gateway_url" {
  value = module.api_gateway.api_gateway_url
}