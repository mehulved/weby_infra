data "aws_caller_identity" "current" {}

resource "aws_s3_bucket_policy" "asset_bucket" {
  bucket = aws_s3_bucket.asset_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "AllowWriteObjectsPolicy"
    Statement = [
      {
        Sid       = "StoreObjects"
        Effect    = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/assessment-account1" 
        }
        Action    = ["s3:PutObject","s3:ListBucket"]
        Resource = [
          aws_s3_bucket.asset_bucket.arn,
          "${aws_s3_bucket.asset_bucket.arn}/*",
        ]
      },
    ]
  })
}

resource "aws_s3_bucket" "asset_bucket" {
  bucket = "weby-asset-bucket"
  acl    = "private"

  website {
    index_document = "index.html"
    error_document = "error.html"

  }

  tags = {
    Name = "Weby Assets Bucket"
  }
}

locals {
  s3_origin_id = "webyS3Origin"
}

resource "aws_cloudfront_distribution" "asset_cdn" {
  origin {
    domain_name = aws_s3_bucket.asset_bucket.bucket_domain_name
    origin_id   = local.s3_origin_id

  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  tags = {
    Environment = var.environment
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
