variable "lambda_name" {
  default = "simple-lambda"
}

variable "lambda_function_path" {
  default = "src/main/java/com/example/simplelambda/SimpleHandler.java"
}

variable "app_version" {
  default = "0.0.1-SNAPSHOT"
}

variable "lambda_handler" {
  default = "com.example.simplelambda.SimpleHandler::handleRequest"
}

variable "lambda_runtime" {
  default = "java21"
}

variable "lambda_memory_size" {
  default = 128
}

variable "lambda_environment" {
  default = "Development"
}