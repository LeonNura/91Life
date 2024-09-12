# variable.tf file for the hello module

variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project"
  # default     = "ninetyone-life-playground"
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

variable "source_file_hello" {
  type        = string
  description = "The source file for the Cloud Function"
  # default     = "./helloWorld.zip"
}

variable "function_name_hello" {
  type        = string
  description = "The name of the Cloud Function"
  # default     = "example-function"
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