resource "aws_lambda_function" "ScaleReal_lambda" {
  function_name    = "ScaleReal_lambda"
  role             = "${var.lambda_exec}"
  handler          = "${var.handler_name}.lambda_handler"
  runtime          = "${var.runtime}"
  timeout          = "${var.timeout}"
  filename         = "${var.handler_name}"
  source_code_hash = "${base64sha256(file("${var.handler_name}"))}"
}

resource "aws_lambda_permission" "APIPermission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.ScaleReal_lambda.function_name}"
  principal     = "apigateway.amazonaws.com"
  source_arn = "${var.API_execution}/Prod/POST/*"

}

resource "aws_lambda_permission" "S3ReadPermission" {
statement_id  = "AllowS3Invoke"
action        = "lambda:InvokeFunction"
function_name = "${aws_lambda_function.ScaleReal_lambda.function_name}"
principal = "s3.amazonaws.com"
source_arn = "arn:aws:s3:::${var.S3_id}"
}
