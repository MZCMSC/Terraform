# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                           NAT G/W EIP
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

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                          NAT G/W 생성
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
