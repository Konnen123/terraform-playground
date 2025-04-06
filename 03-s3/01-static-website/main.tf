resource "aws_s3_bucket" "portfolio_website" {
  bucket = var.bucket

  tags = {
    Name = var.bucket_name
    Environment = var.environment
  }
}

