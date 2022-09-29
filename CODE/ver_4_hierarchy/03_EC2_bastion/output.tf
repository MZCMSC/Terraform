# # output "vpc_id" {
# #   value = aws_vpc.this.id
# # }

# # output "vpc" {
# #   value = data.terraform_remote_state.vpc
# # }
# # output "sg" {
# #   value = data.terraform_remote_state.sg
# # }

output "ec2_bastaio_id" {
    value = aws_instance.bastion.id
}