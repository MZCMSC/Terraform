# RDS Aurora Cluster
resource "aws_rds_cluster" "this" {
  cluster_identifier   = "test-tf-rds-aurora-cluster"
  db_subnet_group_name = aws_db_subnet_group.this.id

  engine         = "aurora-mysql"
  engine_version = "8.0.mysql_aurora.3.02.0"

  database_name   = "testterraformdb"
  master_username = "admin"
  master_password = "DBAdmin1004"

  port = 3306

  vpc_security_group_ids = [
    data.terraform_remote_state.sg.outputs.rds_sg_id
  ]

  skip_final_snapshot = true

  backup_retention_period = 1

  db_cluster_parameter_group_name  = aws_rds_cluster_parameter_group.this.id
  db_instance_parameter_group_name = aws_db_parameter_group.this.id

}


# RDS Aurora instance
resource "aws_rds_cluster_instance" "this" {
  count      = 2
  identifier = "test-tf-rds-aurora-${count.index}"

  cluster_identifier   = aws_rds_cluster.this.id
  db_subnet_group_name = aws_db_subnet_group.this.id

  instance_class = "db.t3.medium"

  engine         = "aurora-mysql"
  engine_version = "8.0.mysql_aurora.3.02.0"

  publicly_accessible = false

  apply_immediately = false

  copy_tags_to_snapshot = false

  db_parameter_group_name = aws_db_parameter_group.this.id
}
