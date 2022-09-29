variable "region" {
  description = "AWS Region"
  type        = string
  default     = ""
}
variable "s3_bucket" {
  description = "S3 bucket for terraform-state-backend"
  type        = string
  default     = ""
}
variable "s3_acl" {
  description = "ACL of S3 Bucket"
  type        = string
  default     = ""
}
variable "dynamodb_table" {
  description = "DynamoDB table for terraform-state-backend"
  type        = string
  default     = ""
}
variable "tags" {
  description = "tag map"
  type        = map(string)
}