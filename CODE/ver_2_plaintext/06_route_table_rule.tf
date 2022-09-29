# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#             Public RTB Route rule IGW Association
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_route" "pub_a_main_rtb_rt" {
  route_table_id         = aws_route_table.pub_a_main_rtb.id
  gateway_id             = aws_internet_gateway.this.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on             = [aws_route_table.pub_a_main_rtb]
}
resource "aws_route" "pub_c_main_rtb_rt" {
  route_table_id         = aws_route_table.pub_c_main_rtb.id
  gateway_id             = aws_internet_gateway.this.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on             = [aws_route_table.pub_c_main_rtb]
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#           Private RTB Route rule NatGW Association
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_route" "pri_a_was_rtb_rt" {
  route_table_id         = aws_route_table.pri_a_was_rtb.id
  nat_gateway_id         = aws_nat_gateway.natgw_a.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on             = [aws_route_table.pri_a_was_rtb]
}
resource "aws_route" "pri_c_was_rtb_rt" {
  route_table_id         = aws_route_table.pri_c_was_rtb.id
  nat_gateway_id         = aws_nat_gateway.natgw_c.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on             = [aws_route_table.pri_c_was_rtb]
}


/* 
# resource "aws_route" "pri_a_web_rtb_rt" {
#    route_table_id = aws_route_table.pri_a_web_rtb.id
#     nat_gateway_id = aws_nat_gateway.natgw_a.id
#     destination_cidr_block = "0.0.0.0/0"
#     depends_on = [ aws_route_table.pri_a_web_rtb ]
# }
# resource "aws_route" "pri_c_web_rtb_rt" {
#    route_table_id = aws_route_table.pri_c_web_rtb.id
#     nat_gateway_id = aws_nat_gateway.natgw_c.id
#     destination_cidr_block = "0.0.0.0/0"
#     depends_on = [ aws_route_table.pri_c_web_rtb ]
# }
# resource "aws_route" "pri_a_rds_rtb_rt" {
#    route_table_id = aws_route_table.pri_a_rds_rtb.id
#     nat_gateway_id = aws_nat_gateway.natgw_a.id
#     destination_cidr_block = "0.0.0.0/0"
#     depends_on = [ aws_route_table.pri_a_rds_rtb ]
# }
# resource "aws_route" "pri_c_rds_rtb_rt" {
#    route_table_id = aws_route_table.pri_c_rds_rtb.id
#     nat_gateway_id = aws_nat_gateway.natgw_c.id
#     destination_cidr_block = "0.0.0.0/0"
#     depends_on = [ aws_route_table.pri_c_rds_rtb ]
# }
 */
 