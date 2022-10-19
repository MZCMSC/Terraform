# ++++++++++++++++++++++++++++++++++++++++++++++
#                   RDS 생성 (Aurora)
# ++++++++++++++++++++++++++++++++++++++++++++++
# Aurora Cluster
resource "aws_rds_cluster" "this" {
  cluster_identifier               = "test-tf-rds-aurora-cluster"
  db_subnet_group_name             = aws_db_subnet_group.this.id
  engine                           = "aurora-mysql"
  engine_version                   = "8.0.mysql_aurora.3.02.0"
  database_name                    = "testterraformdb"
  master_username                  = "admin"
  master_password                  = "DBAdmin1004"
  port                             = 3306
  vpc_security_group_ids           = [aws_security_group.rds_sg.id]
  skip_final_snapshot              = true
  db_cluster_parameter_group_name  = aws_rds_cluster_parameter_group.this.id
  db_instance_parameter_group_name = aws_db_parameter_group.this.id
}

# Aurora instance
resource "aws_rds_cluster_instance" "this" {
  count                   = 2
  identifier              = "test-tf-rds-aurora-${count.index}"
  cluster_identifier      = aws_rds_cluster.this.id
  db_subnet_group_name    = aws_db_subnet_group.this.id
  instance_class          = "db.t3.medium"
  engine                  = "aurora-mysql"
  engine_version          = "8.0.mysql_aurora.3.02.0"
  db_parameter_group_name = aws_db_parameter_group.this.id
}




# # Aurora RDS 특성 고려
# resource "aws_rds_cluster_instance" "write" {
#   identifier = "test-tf-rds-aurora-wrire"

#   cluster_identifier = aws_rds_cluster.this.id
#   db_subnet_group_name    = aws_db_subnet_group.this.id

#   availability_zone = "ap-northeast-2a"

#   instance_class = "db.t3.medium"

#   engine         = "aurora-mysql"
#   engine_version = "8.0.mysql_aurora.3.02.0"

#   db_parameter_group_name = aws_db_parameter_group.this.id
# }
# resource "aws_rds_cluster_instance" "read_1" {
#   identifier = "test-tf-rds-aurora-read-1"

#   cluster_identifier = aws_rds_cluster.this.id
#   db_subnet_group_name    = aws_db_subnet_group.this.id

#   availability_zone = "ap-northeast-2c"

#   instance_class = "db.t3.medium"

#   engine         = "aurora-mysql"
#   engine_version = "8.0.mysql_aurora.3.02.0"

#   db_parameter_group_name = aws_db_parameter_group.this.id
# }
