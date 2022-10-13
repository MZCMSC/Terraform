# output "ec2_id" {
#   value = [aws_instance].id
# }

output "web_a_ec2_id" {
  value = aws_instance.web_a.id
}
output "web_c_ec2_id" {
  value = aws_instance.web_c.id
}

output "was_a_ec2_id" {
  value = aws_instance.was_a.id
}
output "was_c_ec2_id" {
  value = aws_instance.was_c.id
}
