variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-2"
}

variable "s3_bucket" {
  description = "S3 bucket for terraform-state-backend"
  type        = string
  default     = "test-terraform-state-backend-msc"
}

variable "s3_acl" {
  description = "ACL of S3 Bucket"
  type        = string
  default     = "private"
}

variable "dynamodb_table" {
  description = "DynamoDB table for terraform-state-backend"
  type        = string
  default     = "test-terraform-state-locks"
}

variable "tags" {
  description = "tag map"
  type        = map(string)
  default = {
    "CreatedByTerraform" = "true"
    "purpose"            = "TerraformTest"
    "owner"              = "MSC"
    "purpose"            = "TEST"
    "resource"           = "backend_S3"
  }
}