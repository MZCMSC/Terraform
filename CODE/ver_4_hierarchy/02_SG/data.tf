data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "test-terraform-state-backend-msc"
    key    = "vpc/terraform.tfstate"
    region = "ap-northeast-2"
  }
}
