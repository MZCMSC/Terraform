# Default SG Network Disable
resource "aws_default_security_group" "this" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  tags   = merge(var.tags, tomap({ Name = format("%s-%s-default-sg", var.prefix, var.name) }))
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                        Bastion SVR SG
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group" "bastion_sg" {
  description = "Bastion Server Security group"
  name        = "Bastion-SG"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  egress {
    description = "SSH Outbound Port"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0", "10.50.0.0/16"]
  }
  tags = merge(var.tags, tomap({ Name = format("%s-%s-%s-sg", var.prefix, var.name, var.rules.bastion.name) }))
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                         WEB SVR SG
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group" "web_sg" {
  description = "WEB Server Security group"
  name        = "WEB-SG"
  # vpc_id      = aws_vpc.this.id
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  egress {
    description = "WEB server Security group"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["10.50.0.0/16"]
  }
  tags = merge(var.tags, tomap({ Name = format("%s-%s-%s-sg", var.prefix, var.name, var.rules.web.name) }))
}
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                         WAS SVR SG
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group" "was_sg" {
  description = "WAS Server Security group"
  name        = "WAS-SG"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  egress {
    description = "WAS server Security group"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["10.50.0.0/16"]
  }
  tags = merge(var.tags, tomap({ Name = format("%s-%s-%s-sg", var.prefix, var.name, var.rules.was.name) }))

}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                         RDS AuroraDB SG
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group" "rds_sg" {
  description = "RDS Datebase Security group"
  name        = "RDS-SG"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  egress {
    description = "RDS Datebase Security group"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["10.50.0.0/16"]
  }
  tags = merge(var.tags, tomap({ Name = format("%s-%s-%s-sg", var.prefix, var.name, var.rules.rds.name) }))
}


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                       ELB SG (ALB type)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                       Front (Public zone)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group" "front_alb_sg" {
  description = "Front ALB Security group"
  name        = "Front-ALB-SG"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  egress {
    description = "Front ALB Security group"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["10.50.0.0/16"]
  }
  tags = merge(var.tags, tomap({ Name = format("%s-%s-%s-sg", var.prefix, var.name, var.rules.front.name) }))
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                   Backend (Private zone)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group" "backend_alb_sg" {
  description = "Backend ALB Security group"
  name        = "backend-ALB-SG"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  egress {
    description = "Backend ALB Security group"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["10.50.0.0/16"]
  }
  tags = merge(var.tags, tomap({ Name = format("%s-%s-%s-sg", var.prefix, var.name, var.rules.backend.name) }))
}