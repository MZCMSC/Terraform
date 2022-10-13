data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "test-terraform-state-backend-msc"
    key    = "vpc/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

data "terraform_remote_state" "sg" {
  backend = "s3"
  config = {
    bucket = "test-terraform-state-backend-msc"
    key    = "sg/terraform.tfstate"
    region = "ap-northeast-2"
  }
}