# output "vpc_id" {
#   value = data.terraform_remote_state.vpc.outputs.vpc_id
# }

output "bastion_sg_id" {
  description = "Bastion Security Group"
  value       = aws_security_group.bastion_sg.id
}
output "web_sg_id" {
  description = "WEB Security Group"
  value       = aws_security_group.web_sg.id
}
output "was_sg_id" {
  description = "WAS Security Group" 
  value       = aws_security_group.was_sg.id
}
output "rds_sg_id" {
  description = "RDS AuroraDB Security Group"
  value       = aws_security_group.rds_sg.id
}
output "alb_front_sg_id" {
  description = "ALB Front Security Group"
  value       = aws_security_group.front_alb_sg.id
}
output "alb_backend_sg_id" {
  description = "ALB Backend Security Group"
  value       = aws_security_group.backend_alb_sg.id
}
