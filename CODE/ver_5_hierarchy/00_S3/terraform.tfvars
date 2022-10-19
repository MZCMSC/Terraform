// S3 버킷 생성 리전
region = "ap-northeast-2"

// S3 버킷 생성 이름
s3_bucket = "test-terraform-state-backend-msc"
// S3 버킷 타입 ( Public / Private  )
s3_acl    = "private"

// DynamoDB 테이블 이름
dynamodb_table = "test-terraform-state-locks"

// 생성 리소스 기본 TAG 키/값
tags = {
  "CreatedByTerraform" = "true"
  "purpose"            = "Terraform_Test"
  "owner"              = "MSC"
  "resource"           = "backend_S3"
}