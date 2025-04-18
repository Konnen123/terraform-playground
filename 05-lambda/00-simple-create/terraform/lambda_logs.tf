resource "aws_cloudwatch_log_group" "aws_cli_log_group" {
  name = "/aws/lambda/${var.lambda_name}"
  retention_in_days = 7
}

data "aws_iam_policy_document" "lambda_logging_policy" {
  statement{
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_role" "lambda_logging" {
  name = "iam_for_lambda_logging"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}