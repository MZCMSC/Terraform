resource "aws_rds_cluster" "this" {

  for_each = { for i in local.rds_cluter : i.name => i }

  cluster_identifier   = format("%s-tf-%s-cluster", var.prefix, each.value.rds_name)
  db_subnet_group_name = aws_db_subnet_group.this[each.value.name].id

  engine         = each.value.engine
  engine_version = each.value.engine_version

  # availability_zones                = var.azs

  database_name   = each.value.database_name
  master_username = each.value.master_username
  master_password = each.value.master_password

  port = 3306

  vpc_security_group_ids = [
    data.terraform_remote_state.sg.outputs.security_group_ids[each.value.security_group_name]
  ]

  skip_final_snapshot = true

  backup_retention_period = 1

  db_cluster_parameter_group_name  = aws_rds_cluster_parameter_group.this[each.value.name].id
  db_instance_parameter_group_name = aws_db_parameter_group.this[each.value.name].id

  tags = merge(var.tags, tomap({ Name = format("%s-tf-%s-cluster", var.prefix, each.value.rds_name) }))
}

# RDS Aurora DB
# 마이시퀄 2대 생성 코드 작성 진행중
# 동일 구조 로컬변수 생성 및 데이터 가공~ 향후 고도화시 능동 확장 고려하여 베이스값만 생성 예정
# 1. 변수(키값) 기준으로 생성 되도록 구성 할것!
# 2. 옵션값 bool 값도? 전체 입/출력 처리 할것인지 고민하면서 작성해야됨 향후에 확인하자.
resource "aws_rds_cluster_instance" "this" {
  for_each = { for i in local.rds_instance : i.instance_name_list => i }

  identifier = format("%s-tf-%s-instance-%s", var.prefix, each.value.rds_name, each.value.instance_name_list)

  cluster_identifier   = aws_rds_cluster.this[each.value.name].id
  db_subnet_group_name = aws_db_subnet_group.this[each.value.name].id


  instance_class = each.value.instance_class

  engine         = each.value.engine
  engine_version = each.value.engine_version

  db_parameter_group_name = aws_db_parameter_group.this[each.value.name].id


  publicly_accessible   = false
  apply_immediately     = false
  copy_tags_to_snapshot = false

  tags = merge(var.tags, tomap({ Name = format("%s-tf-%s-instance-%s", var.prefix, each.value.rds_name, each.value.instance_name_list)}))
}