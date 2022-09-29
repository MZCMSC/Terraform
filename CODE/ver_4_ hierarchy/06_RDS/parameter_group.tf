# Cluster PG type
resource "aws_rds_cluster_parameter_group" "this" {
  # description = 
  # name   = "test-tf-rds-cluster-mysql3-01-0-cpg"

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


# PG type
resource "aws_db_parameter_group" "this" {
  # description = 
  # name   = "test-tf-rds-cluster-mysql3-01-0-pg"

  name   = "test-tf-aurora-mysql8-0"
  family = "aurora-mysql8.0"
}


# RDS Option group
# resource "aws_db_option_group" "this" {
#
# }
