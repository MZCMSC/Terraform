region = "ap-northeast-2"

prefix = "test"
add_rds_aurora = {
  msc_rds_aurora = {
    rds_name = "msc-rds"

    # RDS Engine info
    engine         = "aurora-mysql"
    engine_version = "8.0.mysql_aurora.3.02.0"

    # RDS ID/PW info
    database_name   = "testterraformdb"
    master_username = "admin"
    master_password = "DBAdmin1004"

    # subnet_group info
    rds_subnet_group_cidr_a = "10.50.210.0/24"
    rds_subnet_group_cidr_c = "10.50.220.0/24"

    # parameter_group info
    parameter_group_name   = "aurora-mysql8-0"
    parameter_group_family = "aurora-mysql8.0"

    security_group_name = "rds"

    instance_class = "db.t3.medium"
    instance_name_list = ["bule", "green", ] #// "leman", "red"]
  },
}

add_parameter = {
  character_set_server = {
    name  = "character_set_server"
    value = "utf8"
  },
  character_set_client = {
    name  = "character_set_client"
    value = "utf8"
  },
}

tags = {
  "CreatedByTerraform" = "True"
  "purpose"            = "Terraform_Test"
  "owner"              = "MSC"
  "resource"           = "ALB"
}