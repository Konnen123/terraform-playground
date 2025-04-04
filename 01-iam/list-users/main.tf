data "aws_iam_users" "users" {}

output "users_result" {
  value = data.aws_iam_users.users.names
}