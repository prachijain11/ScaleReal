variable "lambda_exec" {
  description = "Role for s3 and dynamodb connection"
}

variable "handler_name" {
  description = "Main handler name for the Lambda function"
}
variable "runtime" {
  description = "Runtime of Lambda function"
}
variable "timeout" {
  description = "Timeout of Lambda function"
}

variable "API_execution" {
  description = "API execution ARN for Lambda function"
}

variable "S3_id" {
  description = "S3 bucket id for Lambda function"
}

variable "S3_name" {
  description = "S3 bucket name for Lambda function"
}