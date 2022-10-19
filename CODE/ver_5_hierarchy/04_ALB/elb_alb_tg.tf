resource "aws_lb_target_group" "this" {
  for_each = { for i in local.target_group : i.name => i }

  name = format("%s-tf-%s-alb-tg", var.prefix, each.value.alb_name)

  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  target_type = each.value.target_type
  protocol    = each.value.protocol
  port        = each.value.port

  tags = merge(var.tags, tomap({ Name = format("%s-tf-%s-alb-tg", var.prefix, each.value.alb_name) }))
}




resource "aws_lb_target_group_attachment" "this" {
  for_each = { for i in local.target_group_attach : i.instance_target => i }

  target_group_arn = aws_lb_target_group.this[each.value.name].arn
  port             = each.value.port
  target_id        = data.terraform_remote_state.ec2.outputs.ec2_instances[each.value.instance_target].id
}








































# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# resource "aws_lb_target_group" "front_alb_tg" {
#   name        = "test-tf-front-alb-tg"
#   vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
#   target_type = "instance"
#   port        = 80
#   protocol    = "HTTP"
# }
# resource "aws_lb_target_group" "backend_alb_tg" {
#   name        = "test-tf-backend-alb-tg"
#   vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
#   target_type = "instance"
#   port        = 8080
#   protocol    = "HTTP"
# }




# resource "aws_lb_target_group_attachment" "front_alb_tg_a_attch" {
#   target_group_arn = aws_lb_target_group.front_alb_tg.arn
#   port             = 80
#   target_id        = data.terraform_remote_state.ec2.outputs.ec2_web_a_id
# }
# resource "aws_lb_target_group_attachment" "front_alb_tg_c_attch" {
#   target_group_arn = aws_lb_target_group.front_alb_tg.arn
#   port             = 80
#   target_id        = data.terraform_remote_state.ec2.outputs.ec2_web_c_id
# }



# resource "aws_lb_target_group_attachment" "backend_alb_tg_a_attch" {
#   target_group_arn = aws_lb_target_group.backend_alb_tg.arn
#   port             = 8080
#   target_id        = data.terraform_remote_state.ec2.outputs.ec2_was_a_id
# }
# resource "aws_lb_target_group_attachment" "backend_alb_tg_c_attch" {
#   target_group_arn = aws_lb_target_group.backend_alb_tg.arn
#   port             = 8080
#   target_id        = data.terraform_remote_state.ec2.outputs.ec2_was_c_id
# }