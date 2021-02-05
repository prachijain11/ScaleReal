output "ScaleReal_lambda" {
  value = "${aws_lambda_function.ScaleReal_lambda.invoke_arn}"
}

output "lambda_arn" {
  value = "${aws_lambda_function.ScaleReal_lambda.arn}"
}
