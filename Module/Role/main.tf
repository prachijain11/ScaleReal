resource "aws_iam_role" "lambda_role" {
  name = "ScaleReal"
  assume_role_policy = file("assume_policy.json")

}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda__policy"
  role = aws_iam_role.lambda_role.id
  policy = file("policy.json")
}