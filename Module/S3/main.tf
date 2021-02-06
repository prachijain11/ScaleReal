resource "aws_s3_bucket" "ScaleReal-DevopsTest" {
  bucket = "scalereal-devopstest"
  acl    = "private"
  tags = {
    Name        = "scalereal-devopstest"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_notification" "aws-lambda-trigger" {
  bucket = "${aws_s3_bucket.ScaleReal-DevopsTest.id}"
  lambda_function {
    lambda_function_arn = "${var.lambda_arn}"
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "file-prefix"
    filter_suffix       = "file-extension"
  }
}