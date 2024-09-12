# terraform.tfvars
project_id       = "ninetyone-life-playground"
region           = "europe-west1"
bucket_name      = "serverless-bucket-index"
object_name_hello      = "hello.zip"
source_file_hello      = "./helloWorld.zip"
object_name_api        = "api.zip"
source_file_api        = "./api.zip"
# function_name    = "example-function"
# api_function_name = "example-api-function"
function_name_hello    = "function-hello"
function_name_api      = "function-api"
runtime          = "nodejs20"
entry_point_hello      = "hello"
entry_point_api        = "api"
api_id           = "example-api-id"
gateway_id       = "example-gateway-id"
spec_template_path = "./spec.yaml.tpl"
spec_output_path  = "./spec.yaml"