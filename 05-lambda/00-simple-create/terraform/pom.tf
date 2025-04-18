
data "template_file" "pom_template" {

  template = file("../templates/pom.tpl")

  vars = {
    artifact      = var.lambda_name
    version       = var.app_version
    description   = "${var.lambda_name} Lambda Function"
  }
}

resource "local_file" "pom_xml" {
  content         = data.template_file.pom_template.rendered
  filename        = "../${var.lambda_name}/pom.xml"
}


resource "null_resource" "build" {

  triggers = {
    java_input_hash = sha256(filebase64(local.handler_file))
  }

  provisioner "local-exec" {
    command = "mvn package -f ../${var.lambda_name}/pom.xml clean package"
  }

  depends_on = [
    local_file.pom_xml
  ]

}