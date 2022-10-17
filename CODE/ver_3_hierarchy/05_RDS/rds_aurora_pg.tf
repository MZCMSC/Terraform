# ++++++++++++++++++++++++++++++++++++++++++++++
#               RDS Parameter group
# ++++++++++++++++++++++++++++++++++++++++++++++
#                    Cluster
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_rds_cluster_parameter_group" "this" {
  description = "TEST RDS Cluster_parameter_group"
  name        = "test-tf-aurora-mysql8-0"
  family      = "aurora-mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }
  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}

# ++++++++++++++++++++++++++++++++++++++++++++++
#                  DB_instance
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_db_parameter_group" "this" {
  description = "TEST RDS Parameter_group"
  name        = "test-tf-aurora-mysql8-0"
  family      = "aurora-mysql8.0"
}
