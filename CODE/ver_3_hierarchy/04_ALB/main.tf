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
    key            = "alb/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
  }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++
# Terrafrom Version 설정 참고 내용
# ++++++++++++++++++++++++++++++++++++++++++++++++++++
/* 
=  0.15.0 : 0.15.0 버전
=! 0.15.0 : 0.15.0 버전 제외
>  0.15.0 : 0.15.0 초과 버전
<  0.15.0 : 0.15.0 미만 버전
>= 0.15.0 : 0.15.0 이상 버전
<= 0.15.0 : 0.15.0 이하 버전
~> 0.15.0 : 0.15.0 이상 3.15.0 미만 버전
 */
