locals {
  subnet_group = flatten([
    for key, value in var.add_rds_aurora : {
      name                    = key
      rds_name                = value.rds_name
      rds_subnet_group_cidr_a = value.rds_subnet_group_cidr_a
      rds_subnet_group_cidr_c = value.rds_subnet_group_cidr_c
    }
  ])
}

locals {
  rds_parameter = flatten([
    for key, value in var.add_rds_aurora : {
      name                   = key
      parameter_group_name   = value.parameter_group_name
      parameter_group_family = value.parameter_group_family
    }
  ])
}

locals {
  rds_cluter = flatten([
    for key, value in var.add_rds_aurora : {
      name                = key
      rds_name            = value.rds_name
      engine              = value.engine
      engine_version      = value.engine_version
      database_name       = value.database_name
      master_username     = value.master_username
      master_password     = value.master_password
      security_group_name = value.security_group_name
    }
  ])
}

# locals {
#   rds_instance = flatten([
#     for key, value in var.add_rds_aurora : {
#       name     = key
#       rds_name = value.rds_name
#       engine         = value.engine
#       engine_version = value.engine_version
#       instance_class = value.instance_class
#       instance_name_list = value.instance_name_list
#     }
#   ])
# }

locals {
  rds_instance = flatten([
    for key, value in var.add_rds_aurora : [
      for item in value.instance_name_list: {
        name     = key
        instance_name_list = item

        rds_name = value.rds_name
        engine         = value.engine
        engine_version = value.engine_version
        instance_class = value.instance_class
      }
    ]
  ])
}
