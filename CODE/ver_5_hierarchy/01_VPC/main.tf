terraform {
  required_version = ">= 1.2.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }

backend "s3" {
    bucket         = "test-terraform-state-backend-msc"
    dynamodb_table = "test-terraform-state-locks"
    key            = "vpc/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
  }
}