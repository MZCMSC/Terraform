# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                           NAT_GW EIP
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_eip" "natgw_a_eip" {
  vpc = true
  lifecycle { create_before_destroy = true }
  tags = merge(var.tags, tomap({ Name = format("%s-%s-%s-nat-eip", var.prefix, var.vpc_name, var.azs.a_zone) }))
}
resource "aws_eip" "natgw_c_eip" {
  vpc = true
  lifecycle { create_before_destroy = true }
  tags = merge(var.tags, tomap({ Name = format("%s-%s-%s-nat-eip", var.prefix, var.vpc_name, var.azs.c_zone) }))
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                          NAT_GW 생성
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_nat_gateway" "natgw_a" {
  allocation_id     = aws_eip.natgw_a_eip.id
  subnet_id         = aws_subnet.main_pub_a_subnet.id
  connectivity_type = "public"
  depends_on        = [aws_eip.natgw_a_eip]
  tags              = merge(var.tags, tomap({ Name = format("%s-%s-%s-natgw", var.prefix, var.vpc_name, var.azs.a_zone) }))
}
resource "aws_nat_gateway" "natgw_c" {
  allocation_id     = aws_eip.natgw_c_eip.id
  subnet_id         = aws_subnet.main_pub_c_subnet.id
  connectivity_type = "public"
  depends_on        = [aws_eip.natgw_c_eip]
  tags              = merge(var.tags, tomap({ Name = format("%s-%s-%s-natgw", var.prefix, var.vpc_name, var.azs.c_zone) }))
}
