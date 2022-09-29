# ++++++++++++++++++++++++++++++++++++++++++++++
#               RDS Subnet group
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_db_subnet_group" "this" {
  description = "RDS Aurora Database subnet group"
  name        = format("%s-tf-%s-subnet-group", var.prefix, var.rds_name)
  subnet_ids = [
    data.terraform_remote_state.vpc.outputs.rds_a_subnet_id,
    data.terraform_remote_state.vpc.outputs.rds_c_subnet_id
  ]

  tags = merge(var.tags, tomap({Name = format("%s-tf-%s-subnet-group", var.prefix, var.rds_name)}))
}
