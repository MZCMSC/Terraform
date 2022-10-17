# ++++++++++++++++++++++++++++++++++++++
#            S3 Bucket 생성
# ++++++++++++++++++++++++++++++++++++++
resource "aws_s3_bucket" "this" {
  bucket = "test-terraform-state-backend-msc"

  # Terraform destroy시 에러 및 삭제 불가
  # lifecycle {
  #   prevent_destroy = true
  # }

  tags = { Name = "test-terraform-state-backend-msc" }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ++++++++++++++++++++++++++++++++++++++
#            DynamoDB table 생성
# ++++++++++++++++++++++++++++++++++++++
resource "aws_dynamodb_table" "this" {
  name         = "test-terraform-state-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = { Name = "test-terraform-state-locks" }
}
