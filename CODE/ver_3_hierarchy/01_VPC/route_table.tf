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
# resource "aws_route_table" "pub_main_rtb" {
#     vpc_id = aws_vpc.this.id
#     tags = {Name = "test-tf-vpc-ap-northeast-2-public-main-rtb"} 
# }
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
# resource "aws_route_table" "pri_web_rtb" {
#     vpc_id = aws_vpc.this.id
#     tags = {Name = "test-tf-vpc-ap-northeast-2-private-web-rtb"} 
# }
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
# resource "aws_route_table" "pri_was_rtb" {
#     vpc_id = aws_vpc.this.id
#     tags = {Name = "test-tf-vpc-ap-northeast-2-private-was-rtb"} 
# }
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
# resource "aws_route_table" "pri_rds_rtb" {
#     vpc_id = aws_vpc.this.id
#     tags = {Name = "test-tf-vpc-ap-northeast-2a-private-rds-rtb"} 
# }
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
