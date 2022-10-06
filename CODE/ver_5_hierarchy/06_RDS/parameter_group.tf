# Cluster PG type
resource "aws_rds_cluster_parameter_group" "this" {
  for_each = { for i in local.rds_parameter : i.name => i }

  description = format("%s-tf-%s-parameter-group", var.prefix, each.value.parameter_group_name)
  name        = format("%s-tf-%s-parameter-group", var.prefix, each.value.parameter_group_name)
  family      = format("%s", each.value.parameter_group_family)


  dynamic "parameter" {
    for_each = var.add_parameter
    iterator = item

    content {
      name  = item.value["name"]
      value = item.value["value"]
      # apply_method = "immediate" # //(Default)(즉시반영)  
    }
  }
  tags = merge(var.tags, tomap({ Name = format(format("%s-tf-%s--parameter-group", var.prefix, each.value.parameter_group_name)) }))
}


# PG type
resource "aws_db_parameter_group" "this" {
  for_each = { for i in local.rds_parameter : i.name => i }

  description = format("%s-tf-%s-parameter-group", var.prefix, each.value.parameter_group_name)
  name        = format("%s-tf-%s-parameter-group", var.prefix, each.value.parameter_group_name)
  family      = format("%s", each.value.parameter_group_family)

  tags = merge(var.tags, tomap({ Name = format(format("%s-tf-%s--parameter-group", var.prefix, each.value.parameter_group_name)) }))
}
