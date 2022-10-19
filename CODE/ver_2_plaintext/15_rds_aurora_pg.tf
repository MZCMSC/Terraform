# ++++++++++++++++++++++++++++++++++++++++++++++
#               RDS Parameter group
# ++++++++++++++++++++++++++++++++++++++++++++++
# Cluster PG type

resource "aws_rds_cluster_parameter_group" "this" {
  name   = "test-tf-aurora-mysql8-0"
  family = "aurora-mysql8.0"

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
#                   PG type
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_db_parameter_group" "this" {
  name   = "test-tf-aurora-mysql8-0"
  family = "aurora-mysql8.0"
}
