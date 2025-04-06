variable "bucket" {
  default = "terraform-playground-portfolio-website"
}

variable "bucket_name" {
  default = "terraform-playground-stefan-portfolio"
}

variable "environment" {
  default = "Dev"
}

variable "mime" {
  type = map(string)

  default = {
    html = "text/html",
    css = "text/css",
    js = "application/javascript",
    scss = "text/css",
    eot = "font/eot",
    otf = "font/otf",
    ttf = "font/ttf",
    woff = "font/woff",
    woff2 = "font/woff2",
    svg = "image/svg+xml",
    jpg = "image/jpg",
    png = "image/png"
  }
}