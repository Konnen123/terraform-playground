resource "aws_iam_user" "mock_user" {
  count = var.user_counter
  name = "Terraform-Playground-${random_pet.pet[count.index].id}"
}

resource "random_pet" "pet" {
  count = var.user_counter
}
