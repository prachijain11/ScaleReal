terraform {
  backend "s3" {

    bucket = "scalereal-devopstest"
    key = "terraform.tfstate"
    region = "us-east-2"
    encrypt = true
  }
}

provider "aws" {
  region = "${var.region}"
}

module "API_Gateway" {
  source = "../Module/API_Gateway"
  lambda_uri_create = "${module.Lambda.lambda_create}"
  lambda_uri_read = "${module.Lambda.lambda_read}"
  lambda_uri_update = "${module.Lambda.lambda_update}"
  lambda_uri_delete = "${module.Lambda.lambda_delete}"
}

module "DynamoDB" {
  source = "../Module/DynamoDB"
}

module "Lambda" {
  source = "../Module/Lambda"
  lambda_exec = "${module.Role.lambda_role}"
  S3_name = "${module.S3.S3_name}"
  S3_id = "${module.S3.S3_id}"
  API_execution = "${module.API_Gateway.ScaleReal_API}"
  timeout = "${var.timeout}"
  runtime = "${var.runtime}"
  handler_name = "${var.handler_name}"
  handler_name_create = "${var.handler_name_create}"
  handler_name_read = "${var.handler_name_read}"
  handler_name_update = "${var.handler_name_update}"
  handler_name_delete = "${var.handler_name_delete}"
}

module "Role" {
  source = "../Module/Role"
}

module "S3" {
  source = "../Module/S3"
  lambda_arn = "${module.Lambda.lambda_arn}"
}