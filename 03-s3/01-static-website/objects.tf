locals {
  dir = "${path.module}/PortfolioWebsiteContent"
  files = fileset(local.dir, "**/*.*")
}

resource "aws_s3_object" "objects_html" {
  for_each = { for file in local.files : file => file }

  bucket = aws_s3_bucket.portfolio_website.id
  key = each.key
  source = "${local.dir}/${each.key}"
  content_type = var.mime[reverse(split(".", each.key))[0]]
  content_disposition = "inline"
  etag = filemd5("${local.dir}/${each.key}")
  acl = "public-read"
}