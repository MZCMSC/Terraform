# output "vpc_id" {
#   value = aws_vpc.this.id
# }

# output "vpc" {
#   value = data.terraform_remote_state.vpc
# }
# output "sg" {
#   value = data.terraform_remote_state.sg
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
