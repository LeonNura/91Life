# main.tf root module

module "hello" {
  source = "./modules/hello"
  project_id             = var.project_id
  region                 = var.region
  bucket_name            = var.bucket_name
  object_name_hello      = var.object_name_hello
  source_file_hello      = var.source_file_hello
  function_name_hello    = var.function_name_hello
  runtime                = var.runtime
  entry_point_hello      = var.entry_point_hello
}

module "api" {
  source = "./modules/api"

  project_id           = var.project_id
  region               = var.region
  function_name_api    = var.function_name_api
  runtime              = var.runtime
  entry_point_api      = var.entry_point_api
  bucket_name_function = var.bucket_name
  object_name_api      = var.object_name_api
  source_file_api      = var.source_file_api
}

module "api_gateway" {
  source = "./modules/gateway"

  project_id         = var.project_id
  region             = var.region
  api_id             = var.api_id
  gateway_id         = var.gateway_id
  spec_template_path = var.spec_template_path
  spec_output_path   = var.spec_output_path
  hello_address      = module.hello.hello_address
  api_address        = module.api.api_address
}

output "api_gateway_url" {
  value = module.api_gateway.api_gateway_url
}