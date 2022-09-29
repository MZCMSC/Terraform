# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                        SG rule Sample
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# resource "aws_security_group_rule" "name" {
#   description = ""
#   type = "ingress" & "egress"
#   from_port = 443
#   to_port = 443
#   protocol = "tcp"
#   security_group_id = 

// 아래 List 항목중 1개는 필수로 설정 해야 합니다. 
// AWS Console rule 의 source 값.
/* 
    cidr_blocks = []
    ipv6_cidr_blocks = []
    self = 
    source_security_group_id = 
    prefix_list_ids  = 
    */

# }


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Bastion SVR SG
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group_rule" "bastion_ssh_ingress_rule" {
  description       = "SSH - Bastion Server inbound rule"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.bastion_sg.id

  # SSH 통신 허용 IP 입력
  cidr_blocks = ["0.0.0.0/16", "211.60.50.190/32"]
  /* 
  211.60.50.190 = Megazone Office IP
 */
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# WEB SVR SG
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group_rule" "web_ssh_ingress_rule" {
  description       = "bastion_server to web_server with SSH"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
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
# WEB server -> ALB 통신용
resource "aws_security_group_rule" "web_service_egress_rule" {
  description       = "Web_server to Backend_ALB"
  type              = "egress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = aws_security_group.web_sg.id

  # WEB server -> Backend_alb 통신 
  source_security_group_id = aws_security_group.backend_alb_sg.id
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
  description       = "bastion_server to was_server with SSH"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
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

  #  Backend ALB -> WAS server 통신용
  source_security_group_id = aws_security_group.backend_alb_sg.id
}
resource "aws_security_group_rule" "was_to_rds_rule" {
  description = "WAS_server to RDS_RDS_server "
  type        = "egress"
  from_port   = 3306
  to_port     = 3306

  protocol          = "tcp"
  security_group_id = aws_security_group.rds_sg.id

  source_security_group_id = aws_security_group.rds_sg.id

}
resource "aws_security_group_rule" "was_to_rds_return_rule" {
  description = "RDS_RDS_server to WAS_server "
  type        = "ingress"
  from_port   = 3306
  to_port     = 3306

  protocol          = "tcp"
  security_group_id = aws_security_group.rds_sg.id

  source_security_group_id = aws_security_group.rds_sg.id
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# RDS AuroraDB SG
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group_rule" "rds_ssh_ingress_rule" {
  description       = "bastion_server to RDS_DB_server with SSH"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.rds_sg.id

  source_security_group_id = aws_security_group.bastion_sg.id
}
