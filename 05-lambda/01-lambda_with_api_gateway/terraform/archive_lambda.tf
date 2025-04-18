locals {
  handler_file = "${path.module}/../lambda/handler.py"
  handler_zip_file = "${path.module}/../handler.zip"
}

resource "null_resource" "delete_zip" {
    triggers = {
        delete_zip = sha256(filebase64(local.handler_file))
    }

    provisioner "local-exec" {
        //command = "rm -rf ${local.handler_zip_file}" // For Linux
      command = "cd .. && del /f /q handler.zip" // For Windows
    }
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = local.handler_file
  output_path = local.handler_zip_file

  depends_on = [null_resource.delete_zip]
}