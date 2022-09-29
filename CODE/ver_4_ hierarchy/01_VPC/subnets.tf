# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                        Subnet 생성
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                        Public Subnet
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_subnet" "main_pub_a_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnets.pub_a.cidr
  availability_zone = var.subnets.pub_a.az
  # tags              = merge(var.tags, tomap({ Name = format("%s-%s-%s-public-main-subnet", var.prefix, var.vpc_name, var.azs[0])}))
  tags              = merge(var.tags, tomap({ Name = format("%s-%s-%s-public-main-subnet", var.prefix, var.vpc_name, var.azs.a_zone)}))
}
resource "aws_subnet" "main_pub_c_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnets.pub_c.cidr
  availability_zone = var.subnets.pub_c.az
  # tags              = merge(var.tags, tomap({ Name = format("%s-%s-%s-public-main-subnet", var.prefix, var.vpc_name, var.azs[1])}))
  tags              = merge(var.tags, tomap({ Name = format("%s-%s-%s-public-main-subnet", var.prefix, var.vpc_name, var.azs.c_zone)}))
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                      Private subnet (WEB)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_subnet" "web_pri_a_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnets.web_a.cidr
  availability_zone = var.subnets.web_a.az
  tags              = merge(var.tags, tomap({ Name = format("%s-%s-%s-private-web-subnet", var.prefix, var.vpc_name, var.azs.a_zone)}))
}
resource "aws_subnet" "web_pri_c_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnets.web_c.cidr
  availability_zone = var.subnets.web_c.az
  tags              = merge(var.tags, tomap({ Name = format("%s-%s-%s-private-web-subnet", var.prefix, var.vpc_name, var.azs.c_zone)}))
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                      Private subnet (WAS)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_subnet" "was_pri_a_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnets.was_a.cidr
  availability_zone = var.subnets.was_a.az
  tags              = merge(var.tags, tomap({ Name = format("%s-%s-%s-private-was-subnet", var.prefix, var.vpc_name, var.azs.a_zone)}))
}
resource "aws_subnet" "was_pri_c_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnets.was_c.cidr
  availability_zone = var.subnets.was_c.az
  tags              = merge(var.tags, tomap({ Name = format("%s-%s-%s-private-was-subnet", var.prefix, var.vpc_name, var.azs.c_zone)}))
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                      Private subnet (RDS)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_subnet" "rds_pri_a_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnets.rds_a.cidr
  availability_zone = var.subnets.rds_a.az
  tags              = merge(var.tags, tomap({ Name = format("%s-%s-%s-private-rds-subnet", var.prefix, var.vpc_name, var.azs.a_zone)}))
}
resource "aws_subnet" "rds_pri_c_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnets.rds_c.cidr
  availability_zone = var.subnets.rds_c.az
  tags              = merge(var.tags, tomap({ Name = format("%s-%s-%s-private-rds-subnet", var.prefix, var.vpc_name, var.azs.c_zone)}))
}