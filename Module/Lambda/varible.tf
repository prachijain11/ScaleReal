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
  description = "S3 bucket arn for Lambda function"
}

variable "handler_name_create" {
  description = "Handler name of the Create Lambda function"
}

variable "handler_name_read" {
  description = "Handler name of the Read Lambda function"
}

variable "handler_name_update" {
  description = "Handler name of the update Lambda function"
}

variable "handler_name_delete" {
  description = "Handler name of the Delete Lambda function"
}