# ++++++++++++++++++++++++++++++++++++++++++++++
#               RDS Subnet group
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_db_subnet_group" "this" {
  description = "RDS Aurora Database subnet group"
  name        = "test-tf-rds-subnet-group"
  subnet_ids = [
    aws_subnet.rds_pri_a_subnet.id,
    aws_subnet.rds_pri_c_subnet.id
  ]

  tags = { Name = "test-tf-rds-subnet-group" }
}