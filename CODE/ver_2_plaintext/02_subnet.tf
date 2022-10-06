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
