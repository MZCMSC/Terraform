variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-2"
}
variable "prefix" {
  # prd,stg,dev,test
  description = "AWS Prefix"
  type        = string
  default     = "test"
}

# variable "azs" {
#   description = "AWS Availability zone"
#   type        = list(string)
#   default     = ["ap-northeast-2a", "ap-northeast-2c"]
# }

variable "azs" {
  description = "AWS Availability zone"
  type        = map(string)
  default     = {
    # availability_zone_a = "ap-northeast-2a"
    # availability_zone_b = "ap-northeast-2b"
    # availability_zone_c = "ap-northeast-2c"
    a_zone = "ap-northeast-2a"
    # b_zone = "ap-northeast-2b"
    c_zone = "ap-northeast-2c"
  }
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "tf-vpc"
}
variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.50.0.0/16"
}
variable "enable_dns_hostnames" {
  type    = string
  default = "true"
}
variable "enable_dns_support" {
  type    = string
  default = "true"
}

variable "subnets" {
  type = map(any)
  default = {
    "pub_a" = {
      cidr = "10.50.10.0/24"
      az = "ap-northeast-2a"
    },
    "pub_c" = {
      cidr = "10.50.20.0/24"
      az = "ap-northeast-2c"
    },
    "web_a" = {
      cidr = "10.50.110.0/24"
      az = "ap-northeast-2a"
    },
    "web_c" = {
      cidr = "10.50.120.0/24"
      az = "ap-northeast-2c"
    },
    "was_a" = {
      cidr = "10.50.130.0/24"
      az = "ap-northeast-2a"
    },
    "was_c" = {
      cidr = "10.50.140.0/24"
      az = "ap-northeast-2c"
    },
    "rds_a" = {
      cidr = "10.50.210.0/24"
      az = "ap-northeast-2a"
    },
    "rds_c" = {
      cidr = "10.50.220.0/24"
      az = "ap-northeast-2c"
    }
  }
}

variable "tags" {
  description = "AWS Default Tags"
  type        = map(string)
  default = {
    "CreatedByTerraform" = "True"
    "purpose"            = "Test"
    "owner"              = "MSC"
    "resource"           = "VPC"
  }
}











# variable "subnets" {
#   description = "map of VPC Subnet CIDR"
#   type        = map(any)
#   default = {
#     "main" = {
#       cidr  = ["10.50.10.0/24", "10.50.20.0/24"]
#       type  = "public"
#       natgw = "no"
#     },
#     web = {
#       cidr  = ["10.50.110.0/24", "10.50.120.0/24"]
#       type  = "private"
#       natgw = "no"
#     },
#     was = {
#       cidr  = ["10.50.130.0/24", "10.50.140.0/24"]
#       type  = "private"
#       natgw = "yes"
#     },
#     rds = {
#       cidr  = ["10.50.210.0/24", "10.50.220.0/24"]
#       type  = "private"
#       natgw = "no"
#     }
#   }
# }



# +++++++++++++++++++++++++++++++++++++++++++++++++++++++
# terraform.tfvars 파일 사용시
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++
# variable "region" {
#   description = "AWS Region"
#   type        = string
#   default     = ""
# }
# variable "prefix" {
#   # prd,stg,dev,test
#   description = "AWS Prefix"
#   type        = string
#   default     = ""
# }
# variable "azs" {
#   description = "AWS Availability zone"
#   type        = list(any)
#   default     = []
# }
# variable "vpc_name" {
#   description = "VPC Name"
#   type        = string
#   default     = ""
# }
# variable "vpc_cidr" {
#   description = "VPC CIDR"
#   type        = string
#   default     = ""
# }
# variable "enable_dns_hostnames" {
#   type    = string
#   default = "true"
# }
# variable "enable_dns_support" {
#   type    = string
#   default = "true"
# }

# variable "subnets" {
#   description = "map of VPC Subnet CIDR"
#   type        = map(any)
#   default = { }
# }

# variable "tags" {
#   description = "AWS Default Tags"
#   type        = map(string)
#   default = { }