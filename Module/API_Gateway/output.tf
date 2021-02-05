output "ScaleReal_API" {
  value = "${aws_api_gateway_rest_api.ScaleReal_API.execution_arn}"
}

output "base_url" {
  value = "${aws_api_gateway_deployment.apideploy.invoke_url}"
}