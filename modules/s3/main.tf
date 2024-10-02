resource "aws_s3_bucket" "everton_barbosa_bucket" {
  bucket = "everton-barbosa-bucket"
}

resource "aws_s3_bucket_lifecycle_configuration" "main" {
  bucket = aws_s3_bucket.everton_barbosa_bucket.id
  rule {
    id     = "expire-objects-after-30-days"
    status = "Enabled"
    expiration {
      days = 30
    }
  }
}
