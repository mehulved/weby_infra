resource "aws_s3_bucket" "state_bucket" {
  bucket = var.state_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "state_lock" {
  name         = var.dynamodb_lock_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
