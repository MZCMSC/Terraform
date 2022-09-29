# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Bastion SVR SG
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group_rule" "bastion_ssh_ingress_rule" {
  description = "SSH - Bastion Server inbound rule"
  type        = var.rules.bastion.type # "ingress"
  from_port   = var.rules.bastion.from_port
  to_port     = var.rules.bastion.to_port
  protocol    = var.rules.bastion.protocol

  security_group_id = aws_security_group.bastion_sg.id

  # SSH 통신 허용 IP 입력
  # 0.0.0.0/0 은 모든것을 포함 하기에 뒤에 MZ_Office P_ip를 포함하는점 고려
  # 여러개 항목을 리스트형식으로 설정 하는것을 보여주기 위함.
  cidr_blocks = ["0.0.0.0/0", "211.60.50.190/32"]
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# WEB SVR SG
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group_rule" "web_ssh_ingress_rule" {
  description = "bastion_server to web_server with SSH"
  type        = var.rules.web.type #"ingress"
  from_port   = var.rules.web.from_port
  to_port     = var.rules.web.to_port
  protocol    = var.rules.web.protocol

  security_group_id = aws_security_group.web_sg.id

  source_security_group_id = aws_security_group.bastion_sg.id
}
resource "aws_security_group_rule" "web_service_ingress_rule" {
  description       = "Front_ALB to Web_server"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.web_sg.id

  source_security_group_id = aws_security_group.front_alb_sg.id
}
resource "aws_security_group_rule" "web_to_backend_return_rule" {
  description       = "Backend_ALB to WEB_server"
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = aws_security_group.web_sg.id

  source_security_group_id = aws_security_group.backend_alb_sg.id
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# WAS SVR SG
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group_rule" "was_ssh_ingress_rule" {
  description = "bastion_server to was_server with SSH"
  type        = var.rules.was.type
  from_port   = var.rules.was.from_port
  to_port     = var.rules.was.to_port
  protocol    = var.rules.was.protocol

  security_group_id = aws_security_group.was_sg.id

  source_security_group_id = aws_security_group.bastion_sg.id
}
resource "aws_security_group_rule" "was_service_ingress_rule" {
  description       = "Backend_ALB to was_server "
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = aws_security_group.was_sg.id

  source_security_group_id = aws_security_group.backend_alb_sg.id
}
resource "aws_security_group_rule" "was_to_rds_return_rule" {
  description       = "RDS_RDS_server to WAS_server "
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.rds_sg.id

  source_security_group_id = aws_security_group.rds_sg.id
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# RDS AuroraDB SG
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group_rule" "rds_ingress_rule" {
  description = "bastion_server to RDS_DB_server"
  type        = var.rules.rds.type
  from_port   = var.rules.rds.from_port
  to_port     = var.rules.rds.to_port
  protocol    = var.rules.rds.protocol

  security_group_id = aws_security_group.rds_sg.id

  source_security_group_id = aws_security_group.bastion_sg.id
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ELB SG (ALB type)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Front
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group_rule" "alb_front_ingress_rule" {
  description = "ELB(ALB type) Inbound"
  type        = var.rules.front.type
  from_port   = var.rules.front.from_port
  to_port     = var.rules.front.to_port
  protocol    = var.rules.front.protocol

  security_group_id = aws_security_group.front_alb_sg.id

  cidr_blocks = ["0.0.0.0/0", ]
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Backend
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group_rule" "alb_backend_ingress_rule" {
  description = "ELB(ALB type) Inbound - WEB to Backend"
  type        = var.rules.backend.type
  from_port   = var.rules.backend.from_port
  to_port     = var.rules.backend.to_port
  protocol    = var.rules.backend.protocol

  security_group_id = aws_security_group.backend_alb_sg.id

  cidr_blocks = ["10.50.0.0/16", ]
}
