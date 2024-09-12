# variables.tf root module
variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project"
  # default     = "your-project-id"
}

variable "region" {
  type        = string
  description = "The region to deploy the function"
  # default     = "europe-west1"
}

variable "bucket_name" {
  type        = string
  description = "The name of the storage bucket"
  # default     = "serverless-bucket-index"
}

variable "object_name_hello" {
  type        = string
  description = "The name of the object in the storage bucket"
  # default     = "hello.zip"
}

variable "object_name_api" {
  type        = string
  description = "The name of the object in the storage bucket"
  # default     = "api.zip"
}

variable "source_file_hello" {
  type        = string
  description = "The source file for the Cloud Function"
  # default     = "./helloWorld.zip"
}

variable "source_file_api" {
  type        = string
  description = "The source file for the Cloud Function"
  # default     = "./api.zip"
}

variable "function_name_hello" {
  type        = string
  description = "The name of the Cloud Function"
  # default     = "example-function"
}

variable "function_name_api" {
  type        = string
  description = "The name of the API Cloud Function"
  # default     = "example-function-api"
}

variable "runtime" {
  type        = string
  description = "The runtime environment for the Cloud Function"
  # default     = "nodejs20"
}

variable "entry_point_hello" {
  type        = string
  description = "The entry point for the Cloud Function"
  # default     = "hello"
}

variable "entry_point_api" {
  type        = string
  description = "The entry point for the Cloud Function"
  # default     = "api"
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