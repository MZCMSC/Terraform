terraform {
  required_version = ">= 1.2.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
  # ++++++++++++++++++++++++++++++++++++++++++++++++++++
  #           State file upload & lock
  #  다중 인원 및 원격 위치에서의 State 파일 참조를 위해서 설정
  # ++++++++++++++++++++++++++++++++++++++++++++++++++++
  backend "s3" {
    bucket         = "test-terraform-state-backend-msc"
    dynamodb_table = "test-terraform-state-locks"
    key            = "ec2/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
  }
}
