resource "aws_s3_bucket" "simple_aws_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_object" "my_coffee" {
  bucket = aws_s3_bucket.simple_aws_bucket.bucket
  key    = "coffee.jpg"
  source = "coffee.jpg"
}