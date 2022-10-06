# ++++++++++++++++++++++++++++++++++++++++++++++++++++
#                  Terraform (init)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++
terraform {
  required_version = ">= 1.2.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}
# ++++++++++++++++++++++++++++++++++++++
#            Provider 설정 
# ++++++++++++++++++++++++++++++++++++++
provider "aws" {
  region = "ap-northeast-2"
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                         VPC 생성
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_vpc" "this" {
  cidr_block = "10.50.0.0/16"
  tags       = { "Name" = "test-tf-vpc" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                        Subnet 생성
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                        Public Subnet
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_subnet" "main_pub_a_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.50.10.0/24"
  availability_zone = "ap-northeast-2a"
  tags              = { Name = "test-tf-ap-northeast-2a-public-main-subnet" }
}
resource "aws_subnet" "main_pub_c_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.50.20.0/24"
  availability_zone = "ap-northeast-2c"
  tags              = { Name = "test-tf-ap-northeast-2c-public-main-subnet" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                      Private subnet (WEB)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_subnet" "web_pri_a_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.50.110.0/24"
  availability_zone = "ap-northeast-2a"
  tags              = { Name = "test-tf-vpc-apnortheast-2a-private-web-subnet" }
}
resource "aws_subnet" "web_pri_c_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.50.120.0/24"
  availability_zone = "ap-northeast-2c"
  tags              = { Name = "test-tf-vpc-ap-northeast-2c-private-web-subnet" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                      Private subnet (WAS)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_subnet" "was_pri_a_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.50.130.0/24"
  availability_zone = "ap-northeast-2a"
  tags              = { Name = "test-tf-vpc-ap-northeast-2a-private-was-subnet" }
}
resource "aws_subnet" "was_pri_c_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.50.140.0/24"
  availability_zone = "ap-northeast-2c"
  tags              = { Name = "test-tf-vpc-ap-northeast-2c-private-was-subnet" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                      Private subnet (RDS)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_subnet" "rds_pri_a_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.50.210.0/24"
  availability_zone = "ap-northeast-2a"
  tags              = { Name = "test-tf-vpc-ap-northeast-2a-private-rds-subnet" }
}
resource "aws_subnet" "rds_pri_c_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.50.220.0/24"
  availability_zone = "ap-northeast-2c"
  tags              = { Name = "test-tf-vpc-ap-northeast-2c-private-rds-subnet" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#               Internet G/W 생성 및 VPC 연결
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "test-tf-vpc-igw" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                             NAT G/W
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                         NAT G/W and EIP
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_eip" "natgw_a_eip" {
  vpc = true
  lifecycle { create_before_destroy = true }
  tags = { Name = "test-tf-vpc-ap-northeast-2a-nat-eip" }
}
resource "aws_eip" "natgw_c_eip" {
  vpc = true
  lifecycle { create_before_destroy = true }
  tags = { Name = "test-tf-vpc-ap-northeast-2c-nat-eip" }
}

resource "aws_nat_gateway" "natgw_a" {
  allocation_id     = aws_eip.natgw_a_eip.id
  subnet_id         = aws_subnet.main_pub_a_subnet.id
  connectivity_type = "public"
  depends_on        = [aws_eip.natgw_a_eip]
  tags              = { Name = "test-tf-vpc-ap-northeast-2a-main-natgw" }
}
resource "aws_nat_gateway" "natgw_c" {
  allocation_id     = aws_eip.natgw_c_eip.id
  subnet_id         = aws_subnet.main_pub_c_subnet.id
  connectivity_type = "public"
  depends_on        = [aws_eip.natgw_c_eip]
  tags              = { Name = "test-tf-vpc-ap-northeast-2c-main-natgw" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                       Route table
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_default_route_table" "this" {
  default_route_table_id = aws_vpc.this.default_route_table_id
  # route = [ {
  #   cidr_block = "10.50.1.0/24"
  #   core_network_arn = "value"
  #   destination_prefix_list_id = "value"
  #   egress_only_gateway_id = "value"
  #   gateway_id = "value"
  #   instance_id = "value"
  #   ipv6_cidr_block = "value"
  #   nat_gateway_id = "value"
  #   network_interface_id = "value"
  #   transit_gateway_id = "value"
  #   vpc_endpoint_id = "value"
  #   vpc_peering_connection_id = "value"
  # } ]
  tags = { Name = "test-tf-vpc-default-rtb" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                          Public RTB
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_route_table" "pub_a_main_rtb" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "test-tf-vpc-ap-northeast-2a-public-main-rtb" }
}
resource "aws_route_table" "pub_c_main_rtb" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "test-tf-vpc-ap-northeast-2c-public-main-rtb" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                          Private RTB (WEB)                         
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_route_table" "pri_a_web_rtb" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "test-tf-vpc-ap-northeast-2a-private-web-rtb" }
}
resource "aws_route_table" "pri_c_web_rtb" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "test-tf-vpc-ap-northeast-2c-private-web-rtb" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                          Private RTB (WAS)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_route_table" "pri_a_was_rtb" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "test-tf-vpc-ap-northeast-2a-private-was-rtb" }
}
resource "aws_route_table" "pri_c_was_rtb" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "test-tf-vpc-ap-northeast-2c-private-was-rtb" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                          Private RTB (RDS)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_route_table" "pri_a_rds_rtb" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "test-tf-vpc-ap-northeast-2a-private-rds-rtb" }
}
resource "aws_route_table" "pri_c_rds_rtb" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "test-tf-vpc-ap-northeast-2c-private-rds-rtb" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                      Route table association 
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                           Public
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_route_table_association" "pub_a_main_rtb" {
  route_table_id = aws_route_table.pub_a_main_rtb.id
  subnet_id      = aws_subnet.main_pub_a_subnet.id
  # gateway_id = aws_internet_gateway.this.id
}
resource "aws_route_table_association" "pub_c_main_rtb" {
  route_table_id = aws_route_table.pub_c_main_rtb.id
  subnet_id      = aws_subnet.main_pub_c_subnet.id
  # gateway_id = aws_internet_gateway.this.id
}
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                        Private (WEB)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_route_table_association" "pri_a_web_rtb" {
  route_table_id = aws_route_table.pri_a_web_rtb.id
  subnet_id      = aws_subnet.web_pri_a_subnet.id
  # gateway_id = aws_nat_gateway.natgw_a.id

}
resource "aws_route_table_association" "pri_c_web_rtb" {
  route_table_id = aws_route_table.pri_c_web_rtb.id
  subnet_id      = aws_subnet.web_pri_c_subnet.id
  # gateway_id = aws_nat_gateway.natgw_c.id
}
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                        Private (WAS)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_route_table_association" "pri_a_was_rtb" {
  route_table_id = aws_route_table.pri_a_was_rtb.id
  subnet_id      = aws_subnet.was_pri_a_subnet.id
  # gateway_id = aws_nat_gateway.natgw_a.id
}
resource "aws_route_table_association" "pri_c_was_rtb" {
  route_table_id = aws_route_table.pri_c_was_rtb.id
  subnet_id      = aws_subnet.was_pri_c_subnet.id
  # gateway_id = aws_nat_gateway.natgw_c.id
}
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                        Private (RDS)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_route_table_association" "pri_a_rds_rtb" {
  route_table_id = aws_route_table.pri_a_rds_rtb.id
  subnet_id      = aws_subnet.rds_pri_a_subnet.id
  # gateway_id = aws_nat_gateway.natgw_a.id
}
resource "aws_route_table_association" "pri_c_rds_rtb" {
  route_table_id = aws_route_table.pri_c_rds_rtb.id
  subnet_id      = aws_subnet.rds_pri_c_subnet.id
  # gateway_id = aws_nat_gateway.natgw_c.id
}

# Default SG Network Disable
resource "aws_default_security_group" "this" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "test-tf-default-sg" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                        Bastion SVR SG
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group" "bastion_sg" {
  description = "Bastion Server Security group"
  name        = "Bastion-SG"
  vpc_id      = aws_vpc.this.id

  # ingress{
  #     description = "SSH Inbound Port"
  #     protocol = "tcp"
  #     from_port = 22
  #     to_port = 22
  #     cidr_blocks = ["0.0.0.0/0"]
  # }
  egress {
    description = "SSH Outbound Port"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = { Name = "test-tf-bastion-sg" }
}

# WEB SVR SG
resource "aws_security_group" "web_sg" {
  description = "WEB Server Security group"
  name        = "WEB-SG"
  vpc_id      = aws_vpc.this.id

  # ingress{
  #     description = "WEB server Security group"
  #     protocol = "tcp"
  #     from_port = 80
  #     to_port = 80
  #     cidr_blocks = ["0.0.0.0/0"]
  # }
  egress {
    description = "WEB server Security group"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = { Name = "test-tf-web-sg" }
}

# WAS SVR SG
resource "aws_security_group" "was_sg" {
  description = "WAS Server Security group"
  name        = "WAS-SG"
  vpc_id      = aws_vpc.this.id

  # ingress{
  #     description = "WAS server Security group"
  #     protocol = "tcp"
  #     from_port = 8080
  #     to_port = 8080
  #     cidr_blocks = ["0.0.0.0/0"]
  # }
  egress {
    description = "WAS server Security group"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = { Name = "test-tf-was-sg" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                         RDS AuroraDB SG
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group" "rds_sg" {
  description = "RDS Datebase Security group"
  name        = "RDS-SG"
  vpc_id      = aws_vpc.this.id

  # ingress {
  #     description = "RDS Datebase Security group"
  #     protocol = "tcp"
  #     from_port = 3306
  #     to_port = 3306
  #     cidr_blocks = ["0.0.0.0/0"]
  # }

  egress {
    description = "RDS Datebase Security group"
    protocol    = "tcp"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    # cidr_blocks = ["${aws_security_group.was_sg.id}"]
  }
  tags = { Name = "test-tf-rds-sg" }
}


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                       ELB SG (ALB type)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                       Front (Public zone)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group" "front_alb_sg" {
  description = "Front ALB Security group"
  name        = "Front-ALB-SG"
  vpc_id      = aws_vpc.this.id

  ingress {
    description = "Front ALB Security group"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Front ALB Security group"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = { Name = "test-tf-front-alb-sg" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                   Backend (Private zone)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_security_group" "backend_alb_sg" {
  description = "Backend ALB Security group"
  name        = "backend-ALB-SG"
  vpc_id      = aws_vpc.this.id

  ingress {
    description = "Backend ALB Security group"
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Backend ALB Security group"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = { Name = "test-tf-backend-alb-sg" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                        SG rule Sample
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/* 
resource "aws_security_group_rule" "name" {
    description = ""
    type = "ingress" & "egress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    security_group_id = 

  아래 List 항목중 1개는 필수로 설정 해야 합니다. 
    AWS Console rule 의 source 값.
    cidr_blocks = []
    ipv6_cidr_blocks = []
    self = 
    source_security_group_id = 
    prefix_list_ids  = 
}
*/

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
  cidr_blocks = ["0.0.0.0/0", "211.60.50.190/32"]
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


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ELB SG (ALB type)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Front
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Backend
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                       Bastion Server
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                           EIP
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_eip" "bastion_eip" {
  vpc      = true
  instance = aws_instance.bastion.id
  tags     = { Name = "test-tf-vpc-ap-northeast-2a-bastion-eip" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                       EC2 Instance
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_instance" "bastion" {
  ami               = "ami-0fd0765afb77bcca7"
  availability_zone = "ap-northeast-2a"
  instance_type     = "t2.micro"
  # security_groups   = ["${aws_security_group.bastion_sg.id}", ]
  security_groups   = [aws_security_group.bastion_sg.id, ]
  key_name          = "tf_test_key"
  subnet_id         = aws_subnet.main_pub_a_subnet.id

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    # delete_on_termination = true
    tags = { Name = "test-tf-ap-northeast-2a-bastion" }
  }
  lifecycle { create_before_destroy = true }
  # disable_api_termination = true
  tags = { Name = "test-tf-ap-northeast-2a-bastion" }
}


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                        Service Server
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                          WEB Server
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_instance" "web_a" {
  ami               = "ami-0fd0765afb77bcca7"
  availability_zone = "ap-northeast-2a"
  instance_type     = "t2.micro"
  security_groups   = [aws_security_group.web_sg.id]
  key_name          = "tf_test_key"
  subnet_id         = aws_subnet.web_pri_a_subnet.id

  user_data = <<-EOF
        #!/bin/bash
        sudo yum -y update
        sudo yum -y install httpd
        sudo echo "Test-for-3-tier-Terraform-configuration-2a" > /var/www/html/index.html
        sudo systemctl restart httpd
        --//--
        EOF

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 8
    volume_type = "gp3"
    # delete_on_termination = true
    tags = { Name = "test-tf-ap-northeast-2a-web" }
  }
  lifecycle { create_before_destroy = true }
  # disable_api_termination = true
  tags = { Name = "test-tf-ap-northeast-2a-web" }
}
resource "aws_instance" "web_c" {
  ami               = "ami-0fd0765afb77bcca7"
  availability_zone = "ap-northeast-2c"
  instance_type     = "t2.micro"
  security_groups   = [aws_security_group.web_sg.id]
  key_name          = "tf_test_key"
  subnet_id         = aws_subnet.web_pri_c_subnet.id

  user_data = <<-EOF
        #!/bin/bash
        sudo yum -y update
        sudo yum -y install httpd
        sudo echo "Test-for-3-tier-Terraform-configuration-2a" > /var/www/html/index.html
        sudo systemctl restart httpd
        --//--
        EOF

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 8
    volume_type = "gp3"
    # delete_on_termination = true
    tags = { Name = "test-tf-ap-northeast-2c-web" }
  }
  lifecycle { create_before_destroy = true }
  # disable_api_termination = true
  tags = { Name = "test-tf-ap-northeast-2c-web" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                          WAS Server
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_instance" "was_a" {
  ami               = "ami-0fd0765afb77bcca7"
  availability_zone = "ap-northeast-2a"
  instance_type     = "t2.micro"
  security_groups   = [aws_security_group.was_sg.id]
  key_name          = "tf_test_key"
  subnet_id         = aws_subnet.was_pri_a_subnet.id

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 8
    volume_type = "gp3"
    # delete_on_termination = true
    tags = { Name = "test-tf-ap-northeast-2a-was" }
  }
  lifecycle { create_before_destroy = true }
  # disable_api_termination = true
  tags = { Name = "test-tf-ap-northeast-2a-was" }
}
resource "aws_instance" "was_c" {
  ami               = "ami-0fd0765afb77bcca7"
  availability_zone = "ap-northeast-2c"
  instance_type     = "t2.micro"
  security_groups   = [aws_security_group.was_sg.id]
  key_name          = "tf_test_key"
  subnet_id         = aws_subnet.was_pri_c_subnet.id

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 8
    volume_type = "gp3"
    # delete_on_termination = true
    tags = { Name = "test-tf-ap-northeast-2c-was" }
  }
  lifecycle { create_before_destroy = true }
  # disable_api_termination = true
  tags = { Name = "test-tf-ap-northeast-2c-was" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++
#                 ELB (ALB type)
# ++++++++++++++++++++++++++++++++++++++++++++++
#                   Front
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb" "front_alb" {
  name               = "test-tf-ext-front-alb"
  internal           = false # Public
  load_balancer_type = "application"
  subnets = [
    aws_subnet.main_pub_a_subnet.id,
    aws_subnet.main_pub_c_subnet.id
  ]
  security_groups = [
    aws_security_group.front_alb_sg.id, 
  ]
  #     depends_on = [ 
  #         aws_lb_target_group.front_alb_tg
  # ]
  # tags = ""

}

# ++++++++++++++++++++++++++++++++++++++++++++++
#                   backend
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb" "backend_alb" {
  name               = "test-tf-int-backend-alb"
  internal           = true # Private
  load_balancer_type = "application"
  subnets = [
    aws_subnet.web_pri_a_subnet.id,
    aws_subnet.web_pri_c_subnet.id
  ]
  security_groups = [
    aws_security_group.backend_alb_sg.id
  ]
  # depends_on = [ 
  #     aws_lb_target_group.backend_alb_tg
  # ]

  # tags = ""
}

# ++++++++++++++++++++++++++++++++++++++++++++++
# ALB Target Group
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb_target_group" "front_alb_tg" {
  name        = "test-tf-front-alb-tg"
  vpc_id      = aws_vpc.this.id
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
}
resource "aws_lb_target_group" "backend_alb_tg" {
  name        = "test-tf-backend-alb-tg"
  vpc_id      = aws_vpc.this.id
  target_type = "instance"
  port        = 8080
  protocol    = "HTTP"
}

# ++++++++++++++++++++++++++++++++++++++++++++++
# ALB Target Group Attachment
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb_target_group_attachment" "front_alb_tg_a_attach" {
  target_group_arn = aws_lb_target_group.front_alb_tg.arn
  port             = 80
  target_id        = aws_instance.web_a.id
}
resource "aws_lb_target_group_attachment" "front_alb_tg_c_attach" {
  target_group_arn = aws_lb_target_group.front_alb_tg.arn
  port             = 80
  target_id        = aws_instance.web_c.id
}
resource "aws_lb_target_group_attachment" "backend_alb_tg_a_attach" {
  target_group_arn = aws_lb_target_group.backend_alb_tg.arn
  port             = 8080
  target_id        = aws_instance.was_a.id
}
resource "aws_lb_target_group_attachment" "backend_alb_tg_c_attach" {
  target_group_arn = aws_lb_target_group.backend_alb_tg.arn
  port             = 8080
  target_id        = aws_instance.was_c.id
}

# ++++++++++++++++++++++++++++++++++++++++++++++
#                   ALB Listener
# ++++++++++++++++++++++++++++++++++++++++++++++
#                     Front
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb_listener" "front_alb_listener" {
  load_balancer_arn = aws_lb.front_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_alb_tg.arn
  }
  tags = { Name = "test-tf-vpc-front-alb-listener" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++
#                    Backend
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb_listener" "backend_alb_listener" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = 8080
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend_alb_tg.arn
  }
  tags = { Name = "test-tf-vpc-backend-alb-listener" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++
#               RDS Subnet group
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_db_subnet_group" "this" {
  description = "RDS Aurora Database subnet group"
  name        = "test-tf-rds-subnet-group"
  subnet_ids = [
    aws_subnet.rds_pri_a_subnet.id,
    aws_subnet.rds_pri_c_subnet.id
  ]

  tags = { Name = "test-tf-rds-subnet-group" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++
#               RDS Parameter group
# ++++++++++++++++++++++++++++++++++++++++++++++
#                Cluster PG type
# ++++++++++++++++++++++++++++++++++++++++++++++
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

# ++++++++++++++++++++++++++++++++++++++++++++++
#                   PG type
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_db_parameter_group" "this" {
  # description = 
  # name   = "test-tf-rds-cluster-mysql3-01-0-pg"
  name   = "test-tf-aurora-mysql8-0"
  family = "aurora-mysql8.0"
}

# ++++++++++++++++++++++++++++++++++++++++++++++
#                   RDS 생성 (Aurora)
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_rds_cluster" "this" {
  cluster_identifier = "test-tf-rds-aurora-cluster"
  db_subnet_group_name             = aws_db_subnet_group.this.id
  
  engine         = "aurora-mysql"
  engine_version = "8.0.mysql_aurora.3.02.0"
  
  availability_zones = ["ap-northeast-2a", "ap-northeast-2c"]

  database_name   = "testterraformdb"
  master_username = "admin"
  master_password = "DBAdmin1004"

  port = 3306

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  skip_final_snapshot       = true

  db_cluster_parameter_group_name  = aws_rds_cluster_parameter_group.this.id
  db_instance_parameter_group_name = aws_db_parameter_group.this.id
}


resource "aws_rds_cluster_instance" "this" {
  count      = 2
  identifier = "test-tf-rds-aurora-${count.index}"

  cluster_identifier = aws_rds_cluster.this.id
  db_subnet_group_name    = aws_db_subnet_group.this.id


  instance_class = "db.t3.medium"

  engine         = "aurora-mysql"
  engine_version = "8.0.mysql_aurora.3.02.0"

  db_parameter_group_name = aws_db_parameter_group.this.id
}