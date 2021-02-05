resource "aws_dynamodb_table" "ScaleReal_DDB" {
  name             = "ScaleReal_DDB"
  hash_key         = "id"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  attribute {
    name = "id"
    type = "S"
  }
}