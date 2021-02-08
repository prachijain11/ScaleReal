output "ScaleReal_lambda" {
  value = "${aws_lambda_function.ScaleReal_lambda.invoke_arn}"
}

output "lambda_arn" {
  value = "${aws_lambda_function.ScaleReal_lambda.arn}"
}

output "lambda_create" {
  value = "${aws_lambda_function.Create.invoke_arn}"
}

output "lambda_read" {
  value = "${aws_lambda_function.Read.invoke_arn}"
}

output "lambda_update" {
  value = "${aws_lambda_function.Update.invoke_arn}"
}

output "lambda_delete" {
  value = "${aws_lambda_function.Delete.invoke_arn}"
}