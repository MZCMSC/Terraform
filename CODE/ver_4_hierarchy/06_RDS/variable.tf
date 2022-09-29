variable "prefix" {
  type    = string
  default = "test"
}

variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "azs" {
  type    = list(string)
  default = ["ap-northeast-2a", "ap-northeast-2c"]
}

variable "rds_name" {
  type    = string
  default = "rds-aurora"
}

# variable "engine" {
#   type = string
#   default = "aurora-mysql"
# }
# variable "engine_version" {
#   type = string
#   default = "8.0.mysql_aurora.3.02.0"
# }
variable "engine_info" {
  type = map(string)
  default = {
    engine          = "aurora-mysql"
    engine_version = "8.0.mysql_aurora.3.02.0"
  }
}

# variable "database_name" {
#   type = string
#   default = "testterraformdb"
# }
# variable "master_username" {
#   type = string
#   default = "testterraformdb"
# }
# variable "master_password" {
#   type = string
#   default = "DBAdmin1004"
# }
variable "rds_cluster_identifier" {
  type = map(string)
  default = {
    database_name   = "testterraformdb"
    master_username = "admin"
    master_password = "DBAdmin1004"
  }

}

variable "tags" {
  type = map(string)
  default = {
    "CreatedByTerraform" = "True"
    "purpose"            = "Test"
    "owner"              = "MSC"
    "resource"           = "RDS"
  }
}