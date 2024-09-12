# Variables
variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project"
  # default     = "ninetyone-life-playground"
}

variable "region" {
  type        = string
  description = "The region to deploy the resources"
  # default     = "europe-west1"
}

variable "bucket_name_function" {
  type        = string
  description = "The name of the Google Cloud Storage bucket"
  # default     = "serverless-bucket-index"
}

variable "object_name_api" {
  type        = string
  description = "The name of the object to upload to the bucket"
  # default     = "api.zip"
}

variable "source_file_api" {
  type        = string
  description = "The path to the source file to upload"
  # default     = "./api.zip"
}

variable "function_name_api" {
  type        = string
  description = "The name of the Google Cloud Function"
  # default     = "example-function-api"
}

variable "runtime" {
  type        = string
  description = "The runtime environment of the Google Cloud Function"
  # default     = "nodejs20"
}

variable "entry_point_api" {
  type        = string
  description = "The entry point of the Google Cloud Function"
  # default     = "api"
}