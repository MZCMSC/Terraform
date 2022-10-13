# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                      Route_table routes
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Public
resource "aws_route" "pub_a_main_rt" {
  route_table_id = aws_route_table.pub_a_main_rtb.id
  gateway_id = aws_internet_gateway.this.id
  destination_cidr_block = "0.0.0.0/0"
}
resource "aws_route" "pub_c_main_rt" {
  route_table_id = aws_route_table.pub_c_main_rtb.id
  gateway_id = aws_internet_gateway.this.id
  destination_cidr_block = "0.0.0.0/0"
}

# Private (WEB)
resource "aws_route" "pri_a_web_rt" {
  route_table_id = aws_route_table.pri_a_web_rtb.id
  nat_gateway_id = aws_nat_gateway.natgw_a.id
  destination_cidr_block = "0.0.0.0/0"
}
resource "aws_route" "pri_c_web_rt" {
  route_table_id = aws_route_table.pri_c_web_rtb.id
  nat_gateway_id = aws_nat_gateway.natgw_c.id
  destination_cidr_block = "0.0.0.0/0"
}
# Private (WAS)
resource "aws_route" "pri_a_was_rt" {
  route_table_id = aws_route_table.pri_a_was_rtb.id
  nat_gateway_id = aws_nat_gateway.natgw_a.id
  destination_cidr_block = "0.0.0.0/0"
}
resource "aws_route" "pri_c_was_rt" {
  route_table_id = aws_route_table.pri_c_was_rtb.id
  nat_gateway_id = aws_nat_gateway.natgw_c.id
  destination_cidr_block = "0.0.0.0/0"
}
# Private (RDS)
resource "aws_route" "pri_a_rds_rt" {
  route_table_id = aws_route_table.pri_a_rds_rtb.id
  nat_gateway_id = aws_nat_gateway.natgw_a.id
  destination_cidr_block = "0.0.0.0/0"
}
resource "aws_route" "pri_c_rds_rt" {
  route_table_id = aws_route_table.pri_c_rds_rtb.id
  nat_gateway_id = aws_nat_gateway.natgw_c.id
  destination_cidr_block = "0.0.0.0/0"
}