# ++++++++++++++++++++++++++++++++++++++++++++++
#               RDS Subnet group
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_db_subnet_group" "this" {
  description = "RDS Aurora Database subnet group"
  name        = "test-tf-rds-subnet-group"
  subnet_ids = [
    # aws_subnet.rds_pri_a_subnet.id,
    # aws_subnet.rds_pri_c_subnet.id
    data.terraform_remote_state.vpc.outputs.rds_a_subnet_id,
    data.terraform_remote_state.vpc.outputs.rds_c_subnet_id
  ]

  tags = { Name = "test-tf-rds-subnet-group" }
}
