# ++++++++++++++++++++++++++++++++++++++++++++++
# ALB Target Group
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb_target_group" "front_alb_tg" {
  name        = "test-tf-front-alb-tg"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
}
resource "aws_lb_target_group" "backend_alb_tg" {
  name        = "test-tf-backend-alb-tg"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  target_type = "instance"
  port        = 8080
  protocol    = "HTTP"
}

# ++++++++++++++++++++++++++++++++++++++++++++++
# ALB Target Group Attachment
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb_target_group_attachment" "front_alb_tg_a_attch" {
  target_group_arn = aws_lb_target_group.front_alb_tg.arn
  port             = 80
  target_id = data.terraform_remote_state.ec2.outputs.ec2_web_a_id
}
resource "aws_lb_target_group_attachment" "front_alb_tg_c_attch" {
  target_group_arn = aws_lb_target_group.front_alb_tg.arn
  port             = 80
  target_id = data.terraform_remote_state.ec2.outputs.ec2_web_c_id
}

resource "aws_lb_target_group_attachment" "backend_alb_tg_a_attch" {
  target_group_arn = aws_lb_target_group.backend_alb_tg.arn
  port             = 8080
  target_id = data.terraform_remote_state.ec2.outputs.ec2_was_a_id
}
resource "aws_lb_target_group_attachment" "backend_alb_tg_c_attch" {
  target_group_arn = aws_lb_target_group.backend_alb_tg.arn
  port             = 8080
  target_id = data.terraform_remote_state.ec2.outputs.ec2_was_c_id
}