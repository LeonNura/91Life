# variables.tf file for the gateway module

variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project"
}

variable "region" {
  type        = string
  description = "The region to deploy the API Gateway"
  # default     = "europe-west1"
}

variable "api_id" {
  type        = string
  description = "The ID of the API Gateway API"
  # default     = "example-api-id"
}

variable "gateway_id" {
  type        = string
  description = "The ID of the API Gateway"
  # default     = "example-gateway-id"
}

variable "hello_address" {
  type        = string
  description = "The address of the hello service"
  # default     = "data.terraform_remote_state.hello.outputs.hello_address"
}

variable "api_address" {
  type        = string
  description = "The address of the API service"
  # default     = "data.terraform_remote_state.api.outputs.api_address"
}

variable "spec_template_path" {
  type        = string
  description = "The path to the OpenAPI specification template"
  # default     = "./spec.yaml.tpl"
}

variable "spec_output_path" {
  type        = string
  description = "The output path for the generated OpenAPI specification"
  # default     = "./spec.yaml"
}