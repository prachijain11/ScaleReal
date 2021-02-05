terraform {
  backend "s3" {

    bucket = "ScaleReal-DevopsTest"
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
  lambda_uri = "${module.Lambda.ScaleReal_lambda}"
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
  handler_name = "write_to_dynamodb.handler"
}

module "Role" {
  source = "../Module/Role"
}

module "S3" {
  source = "../Module/S3"
  lambda_arn = "${module.Lambda.lambda_arn}"
}