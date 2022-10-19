region = "ap-northeast-2"
prefix = "test"

azs = ["ap-northeast-2a", "ap-northeast-2c"]

vpc_name = "tf-vpc"
vpc_cidr = "10.50.0.0/16"

enable_dns_hostnames = "true"
enable_dns_support   = "true"

enable_internet_gateway = "true"
enable_nat_gateway      = "true"

subnets = {
  main = {
    "cidr"  = ["10.50.10.0/24", "10.50.20.0/24"]
    "type"  = "public"
    "natgw" = "no"
  },
  web = {
    "cidr"  = ["10.50.110.0/24", "10.50.120.0/24"]
    "type"  = "private"
    "natgw" = "no"
  },
  was = {
    "cidr"  = ["10.50.130.0/24", "10.50.140.0/24"]
    "type"  = "private"
    "natgw" = "yes"
  },
  rds = {
    "cidr"  = ["10.50.210.0/24", "10.50.220.0/24"]
    "type"  = "private"
    "natgw" = "no"
  }
}

tags = {
  "CreatedByTerraform" = "True"
  "purpose"            = "Terraform_Test"
  "owner"              = "MSC"
  "resource"           = "VPC"
}