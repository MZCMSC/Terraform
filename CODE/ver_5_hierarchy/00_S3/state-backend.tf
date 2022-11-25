resource "aws_dynamodb_table" "terraform_state_locks" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = merge(var.tags, tomap({ Name = format("%s", var.dynamodb_table) }))
}

resource "aws_s3_bucket" "terraform_state_backend" {
  bucket = var.s3_bucket
  tags   = merge(var.tags, tomap({ Name = format("%s", var.s3_bucket) }))
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.terraform_state_backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.terraform_state_backend.id
  acl    = var.s3_acl
  # acl = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.terraform_state_backend.id
  rule {
    # bucket_key_enabled = 
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
