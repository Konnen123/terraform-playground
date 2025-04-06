resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.portfolio_website.id
  versioning_configuration {
    status = "Enabled"
  }
}