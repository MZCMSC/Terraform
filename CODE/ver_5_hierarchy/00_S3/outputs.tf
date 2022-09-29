output "region" {
  description = "AWS Region"
  value       = var.region
}
output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state_backend.bucket
}
output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_state_locks.name
}
output "s3_bucket_acl" {
  value = aws_s3_bucket_acl.this.acl
}
output "s3_versioning" {
  value = aws_s3_bucket_versioning.this.versioning_configuration
}
output "s3_server_side_encryption_configuration" {
  value = aws_s3_bucket_server_side_encryption_configuration.this.rule
}