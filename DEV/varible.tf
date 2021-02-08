variable "region" {
  description = "Region in which terraform scripts will run"
}

variable "timeout" {
  description = "Timeout of Lambda function"
}

variable "runtime" {
  description = "Runtime of Lambda function"
}

variable "handler_name" {
  description = "Handler name of the Lambda function"
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
