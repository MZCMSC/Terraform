output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnets" {
  value = aws_subnet.this
}

output "subnet_ids" {
  value = { for key, value in aws_subnet.this : key => value.id }
}
