
resource "aws_instance" "instance" {
  ami = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
  key_name = aws_key_pair.key_pair.key_name
}

resource "aws_key_pair" "key_pair" {
  key_name = var.key_pair_name
  public_key = file("my-aws-key.pub")
}