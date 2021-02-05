output "S3_id" {
  value = "${aws_s3_bucket.ScaleReal-DevopsTest.id}"
}

output "S3_name" {
  value = "${aws_s3_bucket.ScaleReal-DevopsTest.arn}"
}