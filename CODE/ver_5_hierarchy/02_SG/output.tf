# output "vpc_id" {
#   value = data.terraform_remote_state.vpc.outputs.vpc_id
# }

output "security_groups" {
  value = aws_security_group.this
}

output "security_group_ids" {
  value = {for key, value in aws_security_group.this : key => value.id}
}