locals {
  app_jar_file = "../${var.lambda_name}/target/${var.lambda_name}-${var.app_version}.jar"
  handler_file = "../${var.lambda_name}/${var.lambda_function_path}"
}

resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_name
  role          = aws_iam_role.iam_role_for_lambda.arn

  filename = local.app_jar_file
  handler = var.lambda_handler
  runtime = var.lambda_runtime
  memory_size = var.lambda_memory_size

  source_code_hash = sha256(filebase64(local.handler_file))

  environment {
    variables = {
      Environment = var.lambda_environment
      MY_ENV = "env-ul meu"
    }
  }

  depends_on = [
    null_resource.build,
    aws_iam_role.lambda_logging,
    aws_cloudwatch_log_group.aws_cli_log_group
  ]
}