# This terraform configuration will host my backend api, quote-of-the-day.
# For API documentation, visit https://github.com/Konnen123/quote-of-the-day
# Backend is running inside a docker container and the requests are reversed proxied using nginx.
# The docker image is retrieved from DockerHub

resource "aws_instance" "backend-api-website" {
  instance_type = var.instance_type
  ami = var.ami
  tags = {
    Name = var.instance_name
  }
  key_name = aws_key_pair.key-pair.key_name
  user_data = file("user_data.sh")
  vpc_security_group_ids = [aws_security_group.security-group-http.id, aws_security_group.security-group-ssh.id]
}

resource "aws_key_pair" "key-pair" {
  key_name = var.key_pair_name
  public_key = file("../../aws_key_pairs/my-aws-key.pub")
}
