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




# Module Block 설명할때 예제

/*
module "vpc" {
  source = "../module/vpc/"

  region                  = var.region
  prefix                  = var.prefix
  azs                     = var.azs
  vpc_name                = var.vpc_name
  vpc_cidr                = var.vpc_cidr
  enable_dns_hostnames    = var.enable_dns_hostnames
  enable_dns_support      = var.enable_dns_support
  enable_internet_gateway = var.enable_internet_gateway
  enable_nat_gateway      = var.enable_nat_gateway
  subnets                 = var.subnets
  tags                    = var.tags
} */

/* 
module ->

tfvars ->

variable ->




*/
