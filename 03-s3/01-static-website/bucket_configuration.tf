resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.portfolio_website.id

  index_document {
    suffix = "index.html"
  }
}