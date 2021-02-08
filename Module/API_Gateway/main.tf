resource "aws_api_gateway_rest_api" "ScaleReal_API" {
  name        = "ScaleReal_API"

}

resource "aws_api_gateway_resource" "Create" {
  rest_api_id = aws_api_gateway_rest_api.ScaleReal_API.id
  parent_id   = aws_api_gateway_rest_api.ScaleReal_API.root_resource_id
  path_part   = "writedb"
}

resource "aws_api_gateway_method" "Create" {
  rest_api_id   = aws_api_gateway_rest_api.ScaleReal_API.id
  resource_id   = aws_api_gateway_resource.Create.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "Create" {
  rest_api_id = aws_api_gateway_rest_api.ScaleReal_API.id
  resource_id = aws_api_gateway_resource.Create.id
  http_method = aws_api_gateway_method.Create.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${var.lambda_uri_create}"
}

resource "aws_api_gateway_resource" "Read" {
  rest_api_id = aws_api_gateway_rest_api.ScaleReal_API.id
  parent_id   = aws_api_gateway_rest_api.ScaleReal_API.root_resource_id
  path_part   = "readdb"
}

resource "aws_api_gateway_method" "Read" {
  rest_api_id   = aws_api_gateway_rest_api.ScaleReal_API.id
  resource_id   = aws_api_gateway_resource.Read.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "Read" {
  rest_api_id = aws_api_gateway_rest_api.ScaleReal_API.id
  resource_id = aws_api_gateway_resource.Read.id
  http_method = aws_api_gateway_method.Read.http_method
  integration_http_method = "GET"
  type                    = "AWS_PROXY"
  uri                     = "${var.lambda_uri_read}"
}

resource "aws_api_gateway_resource" "Update" {
  rest_api_id = aws_api_gateway_rest_api.ScaleReal_API.id
  parent_id   = aws_api_gateway_rest_api.ScaleReal_API.root_resource_id
  path_part   = "readdb"
}

resource "aws_api_gateway_method" "Update" {
  rest_api_id   = aws_api_gateway_rest_api.ScaleReal_API.id
  resource_id   = aws_api_gateway_resource.Update.id
  http_method   = "PUT"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "Update" {
  rest_api_id = aws_api_gateway_rest_api.ScaleReal_API.id
  resource_id = aws_api_gateway_resource.Update.id
  http_method = aws_api_gateway_method.Update.http_method
  integration_http_method = "PUT"
  type                    = "AWS_PROXY"
  uri                     = "${var.lambda_uri_update}"
}

resource "aws_api_gateway_resource" "Delete" {
  rest_api_id = aws_api_gateway_rest_api.ScaleReal_API.id
  parent_id   = aws_api_gateway_rest_api.ScaleReal_API.root_resource_id
  path_part   = "readdb"
}

resource "aws_api_gateway_method" "Delete" {
  rest_api_id   = aws_api_gateway_rest_api.ScaleReal_API.id
  resource_id   = aws_api_gateway_resource.Delete.id
  http_method   = "DELETE"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "Delete" {
  rest_api_id = aws_api_gateway_rest_api.ScaleReal_API.id
  resource_id = aws_api_gateway_resource.Delete.id
  http_method = aws_api_gateway_method.Delete.http_method
  integration_http_method = "DELETE"
  type                    = "AWS_PROXY"
  uri                     = "${var.lambda_uri_delete}"
}

resource "aws_api_gateway_deployment" "apideploy" {
  depends_on = [ aws_api_gateway_integration.Create, aws_api_gateway_integration.Read, aws_api_gateway_integration.Update, aws_api_gateway_integration.Delete]
  rest_api_id = aws_api_gateway_rest_api.ScaleReal_API.id
  stage_name  = "DEV"
}