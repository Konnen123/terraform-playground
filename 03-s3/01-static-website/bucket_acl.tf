resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.portfolio_website.id
  acl = "public-read"
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
}
