resource "aws_subnet" "subnet_public" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "subnet_private" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
}