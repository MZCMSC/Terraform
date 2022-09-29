# # output "vpc_id" {
# #   value = aws_vpc.this.id
# # }

# # output "vpc" {
# #   value = data.terraform_remote_state.vpc
# # }
# # output "sg" {
# #   value = data.terraform_remote_state.sg
# # }

output "ec2_web_a_id" {
  value = aws_instance.web_a.id
}
output "ec2_web_c_id" {
  value = aws_instance.web_c.id
}

output "ec2_was_a_id" {
  value = aws_instance.was_a.id
}
output "ec2_was_c_id" {
  value = aws_instance.was_c.id
}