# RDS 생성 (Aurora)
resource "aws_rds_cluster" "this" {
  cluster_identifier   = format("%s-tf-%s-cluster", var.prefix, var.rds_name) //"test-tf-rds-aurora-cluster"
  db_subnet_group_name = aws_db_subnet_group.this.id

  engine         = var.engine_info.engine
  engine_version = var.engine_info.engine_version

  availability_zones = var.azs

  database_name   = var.rds_cluster_identifier.database_name
  master_username = var.rds_cluster_identifier.master_username
  master_password = var.rds_cluster_identifier.master_password

  port = 3306

  vpc_security_group_ids = [
    data.terraform_remote_state.sg.outputs.rds_sg_id
  ]

  skip_final_snapshot = true

  backup_retention_period = 1

  db_cluster_parameter_group_name  = aws_rds_cluster_parameter_group.this.id
  db_instance_parameter_group_name = aws_db_parameter_group.this.id

  tags = merge(var.tags, tomap({ Name = format("%s-tf-%s-cluster", var.prefix, var.rds_name) }))
}


resource "aws_rds_cluster_instance" "this" {
  count = 2

  identifier = format("%s-tf-%s-%s", var.prefix, var.rds_name, count.index)

  cluster_identifier   = aws_rds_cluster.this.id
  db_subnet_group_name = aws_db_subnet_group.this.id


  instance_class = "db.t3.medium"

  engine         = var.engine_info.engine
  engine_version = var.engine_info.engine_version

  publicly_accessible = false

  apply_immediately = false

  copy_tags_to_snapshot = false

  db_parameter_group_name = aws_db_parameter_group.this.id

  tags = merge(var.tags, tomap({ Name = format("%s-tf-%s-%s", var.prefix, var.rds_name, count.index) }))
}