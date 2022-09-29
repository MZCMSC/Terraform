output "vpc_id" {
  value = aws_vpc.this.id
}

output "pub_a_subnet_id" {
  value = aws_subnet.main_pub_a_subnet.id
}
output "pub_c_subnet_id" {
  value = aws_subnet.main_pub_c_subnet.id
}

output "web_a_subnet_id" {
  value = aws_subnet.web_pri_a_subnet.id
}
output "web_c_subnet_id" {
  value = aws_subnet.web_pri_c_subnet.id
}

output "was_a_subnet_id" {
  value = aws_subnet.was_pri_a_subnet.id
}
output "was_c_subnet_id" {
  value = aws_subnet.was_pri_c_subnet.id
}

output "rds_a_subnet_id" {
  value = aws_subnet.rds_pri_a_subnet.id
}
output "rds_c_subnet_id" {
  value = aws_subnet.rds_pri_c_subnet.id
}

output "igw_id" {
  value = aws_internet_gateway.this.id
}

output "natgw_a_id" {
  value = aws_nat_gateway.natgw_a.id
}
output "natgw_c_id" {
  value = aws_nat_gateway.natgw_c.id
}
