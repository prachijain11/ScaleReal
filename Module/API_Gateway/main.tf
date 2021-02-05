resource "aws_api_gateway_rest_api" "ScaleReal_API" {
  name        = "ScaleReal_API"

}

resource "aws_api_gateway_resource" "writeResource" {
  rest_api_id = aws_api_gateway_rest_api.ScaleReal_API.id
  parent_id   = aws_api_gateway_rest_api.ScaleReal_API.root_resource_id
  path_part   = "writedb"
}

resource "aws_api_gateway_method" "writeMethod" {
  rest_api_id   = aws_api_gateway_rest_api.ScaleReal_API.id
  resource_id   = aws_api_gateway_resource.writeResource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_resource" "readResource" {
  rest_api_id = aws_api_gateway_rest_api.ScaleReal_API.id
  parent_id   = aws_api_gateway_rest_api.ScaleReal_API.root_resource_id
  path_part   = "readdb"
}

resource "aws_api_gateway_method" "readMethod" {
  rest_api_id   = aws_api_gateway_rest_api.ScaleReal_API.id
  resource_id   = aws_api_gateway_resource.readResource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "writeInt" {
  rest_api_id = aws_api_gateway_rest_api.ScaleReal_API.id
  resource_id = aws_api_gateway_resource.writeResource.id
  http_method = aws_api_gateway_method.writeMethod.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${var.lambda_uri}"
}

resource "aws_api_gateway_integration" "readInt" {
  rest_api_id = aws_api_gateway_rest_api.ScaleReal_API.id
  resource_id = aws_api_gateway_resource.readResource.id
  http_method = aws_api_gateway_method.readMethod.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${var.lambda_uri}"
}

resource "aws_api_gateway_deployment" "apideploy" {
  depends_on = [ aws_api_gateway_integration.writeInt, aws_api_gateway_integration.readInt]
  rest_api_id = aws_api_gateway_rest_api.ScaleReal_API.id
  stage_name  = "Prod"
}