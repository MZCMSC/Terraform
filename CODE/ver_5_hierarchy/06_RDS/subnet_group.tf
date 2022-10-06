
resource "aws_db_subnet_group" "this" {
  for_each = { for i in local.subnet_group : i.name => i }

  name = format("%s-tf-%s-subnet-group", var.prefix, each.value.rds_name)

  subnet_ids = [
    data.terraform_remote_state.vpc.outputs.subnet_ids[each.value.rds_subnet_group_cidr_a],
    data.terraform_remote_state.vpc.outputs.subnet_ids[each.value.rds_subnet_group_cidr_c]
  ]

  tags = merge(var.tags, tomap({ Name = format("%s-tf-%s-subnet-group", var.prefix, each.value.rds_name) }))
}