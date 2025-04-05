resource "aws_instance" "simple-nginx-ec2" {
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

